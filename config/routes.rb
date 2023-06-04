Rails.application.routes.draw do
  get 'home/index'
  root to: "home#index"
  get '/login', to: 'sessions#login_form'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/login', to: 'sessions#login_user'
  get '/logout', to: 'sessions#logout_user'
  resources :sessions, only: [:create]

  resources :artists, only: [:new, :create]
  resources :users, only: [:show, :new, :create] do
    resources :discover, only: [:index]
  end
end
