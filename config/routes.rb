Rails.application.routes.draw do
  resources :users
  resources :bookings
  resources :sessions
  root 'users#index'

  post 'login', to: 'sessions#create'
  post 'signup', to: 'users#create'
end
