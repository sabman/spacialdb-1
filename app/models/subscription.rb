class Subscription < ActiveRecord::Base
  belongs_to :plan
  belongs_to :instance

  include AASM

  aasm column: 'state', skip_validation_on_save: true do
    state :pending, initial: true
    state :processing
    state :finished
    state :errored
    state :refunded

    event :process, after: :start_subscription do
      transitions from: :pending, to: :processing
    end
  end

  private

  def start_subscription
  end
end
