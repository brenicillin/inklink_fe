Rails.application.routes.draw do
  get 'home/index'
  root to: "home#index"

  resources :artists, only: [:new, :create]
  resources :users, only: [:new, :create]
end
