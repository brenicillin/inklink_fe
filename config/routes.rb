Rails.application.routes.draw do
  get 'home/index'
  root to: "home#index"
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  resources :artists, only: [:new, :create]
  resources :users, only: [:show, :new, :create]
end
