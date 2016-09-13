Rails.application.routes.draw do
  resources :users
  resources :bookings
  resources :sessions
  resources :flights

  root 'users#get_root'
  get 'users/index', to: 'users#index', as: 'user_home'
  get 'profile', to: 'users#profile', as: 'user_profile'
  get 'home/index', to: 'home#index', as: 'home'
  get 'schedule', to: 'users#schedule', as: 'schedule'
  post 'search', to: 'flights#search', as: 'search'
  post 'select', to: 'bookings#select', as: 'select'
  get 'confirmed/:id', to: 'bookings#confirmation', as: 'booking_confirmation'
  post 'login', to: 'sessions#create'
  post 'signup', to: 'users#create'
  get 'logout', to: 'sessions#destroy'
end
