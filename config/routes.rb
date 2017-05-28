Rails.application.routes.draw do

  root to: "dashboard#index"

  resources :packages
  resources :reports
  resources :addons
  resources :customers
  resources :wash_exceptions
  resources :stolen_cars
  resources :discounts
  resources :washes
  post '/washes/lookup' => 'washes#lookup'
end
