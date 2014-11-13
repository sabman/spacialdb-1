class Plan < ActiveRecord::Base
  after_create :create_stripe_plan

  validates :amount, presence: true
  validates :currency, presence: true
  validates :interval, presence: true
  validates :name, presence: true

  private
    def create_stripe_plan
      begin
        Stripe::Plan.create(
          id: self.id,
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
end
