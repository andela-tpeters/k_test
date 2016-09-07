Rails.application.routes.draw do
  resources :users
  resources :bookings
  resources :sessions

  root 'users#index'
  get 'users/index', to: 'users#index', as: 'user_home'
  get 'home/index', to: 'home#index', as: 'home'
  post 'login', to: 'sessions#create'
  post 'signup', to: 'users#create'
  get 'logout', to: 'sessions#destroy'
end
