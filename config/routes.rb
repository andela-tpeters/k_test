Rails.application.routes.draw do
  resources :users
  resources :bookings
  resources :sessions

  constraints(Auth.new) do
    root 'users#index', as: :user_home
  end

  root 'home#index'

  post 'login', to: 'sessions#create'
  post 'signup', to: 'users#create'
  post 'logout', to: 'sessions#destroy'
  get 'book', to: 'bookings#book'
end
