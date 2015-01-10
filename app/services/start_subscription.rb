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
      customer = find_or_create_customer

    rescue Stripe::StripeError, RuntimeError => e
      subscription.fail!
    end

    subscription
  end

  private

  def find_or_create_customer

  end
end
