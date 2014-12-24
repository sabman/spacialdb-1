class StartSubscription
  def self.call(subscription)
    subscription.save!
  end
end
