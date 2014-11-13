class Plan < ActiveRecord::Base
  after_create :create_stripe_plan
  after_update :update_stripe_plan
  after_destroy { |plan| Stripe::Plan.retrieve(plan.id.to_s).delete }

  validates :amount, presence: true
  validates :currency, presence: true
  validates :interval, presence: true
  validates :name, presence: true

  private
    def create_stripe_plan
      begin
        Stripe::Plan.create(
          id: self.id.to_s,
          amount: self.amount,
          currency: self.currency,
          interval: self.interval,
          interval_count: self.interval_count,
          name: self.name,
          trial_period_days: self.trial_period_days,
          metadata: self.metadata,
          statement_description: self.statement_description
        )
      rescue => e
        logger.info e.message
      end
    end

    def update_stripe_plan
      begin
        p = Stripe::Plan.retrieve(self.id.to_s)
        p.amount = self.amount
        p.currency = self.currency
        p.interval = self.interval
        p.interval_count = self.interval_count
        p.name = self.name
        p.trial_period_days = self.trial_period_days
        p.metadata = self.metadata
        p.statement_description = self.statement_description
        p.save
      rescue => e
        logger.info e.message
      end
    end
end
