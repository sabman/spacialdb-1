class ProcessSubscriptionJob < ActiveJob::Base
  queue_as :default

  def perform(id)
    Subscription.find(id).process!
  end
end
