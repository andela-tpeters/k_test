Rails.application.routes.draw do
  resources :users
  resources :bookings
  root to: "users#index"
end
