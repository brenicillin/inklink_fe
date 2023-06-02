Rails.application.routes.draw do
  get 'home/index'
  root to: "home#index"
  get '/login', to: 'sessions#new'
  resources :sessions, only: [:create, :destroy]

  resources :artists, only: [:new, :create]
  resources :users, only: [:new, :create]
end
