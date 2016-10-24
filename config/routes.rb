Rails.application.routes.draw do
  resources :users, :attractions
  resources :sessions, only: [:new,:create,:destroy]
  resources :rides, only: [:new, :create]

  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  root 'static#home'
end
