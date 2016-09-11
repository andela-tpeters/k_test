Rails.application.routes.draw do
  resources :users
  resources :bookings
  resources :sessions
  resources :flights

  root 'users#get_root'
  get 'users/index', to: 'users#index', as: 'user_home'
  get 'home/index', to: 'home#index', as: 'home'
  put '/users/:id', to: 'users#update', as: 'update_user'
  get 'schedule', to: 'users#schedule', as: 'schedule'
  post 'search', to: 'flights#search', as: 'search'
  post 'login', to: 'sessions#create'
  post 'signup', to: 'users#create'
  get 'logout', to: 'sessions#destroy'
end
