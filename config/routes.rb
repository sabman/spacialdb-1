Rails.application.routes.draw do
  resources :instances
  devise_for :users
  root 'home#index'
end
