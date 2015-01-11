class StartSubscription
  attr_reader :subscription

  def self.call(subscription)
    subscription.save!

    new(subscription).run
  end

  def initialize(subscription)
    @subscription = subscription
  end

  def run
    begin
      customer_id = subscription.instance.user.stripe_customer_id
      customer = Stripe::Customer.retrieve(customer_id)

      create_params = {
        plan: subscription.plan.id.to_s,
        quantity: 1
      }
      stripe_sub = customer.subscriptions.create(create_params)
      subscription.update_attributes(
        stripe_id: stripe_sub.id
      )
      subscription.activate!
    rescue Stripe::StripeError, RuntimeError => e
      subscription.fail!
    end

    subscription
  end
end
