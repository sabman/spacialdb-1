Rails.application.routes.draw do
  resources :instances
  devise_for :users
  mount StripeEvent::Engine => '/events'
  root 'home#index'
end
