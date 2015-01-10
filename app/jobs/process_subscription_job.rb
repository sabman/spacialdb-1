class ProcessSubscriptionJob < ActiveJob::Base
  queue_as :default

  def perform(id)
    # send process event
    Subscription.find(id).process!
  end
end
