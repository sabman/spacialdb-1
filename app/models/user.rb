class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_stripe_customer

  has_many :subscriptions

  private
    def create_stripe_customer
      begin
        customer = Stripe::Customer.create(email: self.email)
      rescue Stripe::StripeError => e
        logger.info e.message
      end
      self.stripe_customer_id = customer.id
      self.save
    end
end
