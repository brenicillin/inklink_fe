require 'sidekiq/web'

Rails.application.routes.draw do
  get 'home/index'
  root to: "home#index"
  get '/login', to: 'sessions#login_form'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/login', to: 'sessions#login_user'
  get '/logout', to: 'sessions#logout_user'

  get "/sent", to: "mailers#sent"
  resources :mailers, only: [:create]

  mount Sidekiq::Web => '/sidekiq'

  resources :sessions, only: [:create]

  resources :artists, only: [:new, :create, :show, :index]
  
  resources :users, only: [:show, :new, :create] do
    resources :discover, only: [:index]
    resources :search, only: [:index]
  end
end
