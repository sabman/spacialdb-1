Stripe.api_key = Rails.application.secrets.stripe_secret_key

StripeEvent.event_retriever = lambda do |params|
  
end

StripeEvent.configure do |events|
end
