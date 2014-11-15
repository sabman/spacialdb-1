class Subscription < ActiveRecord::Base
  belongs_to :plan
  belongs_to :instance
end
