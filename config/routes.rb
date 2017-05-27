Rails.application.routes.draw do

  root to: "dashboard#index"

  resources :packages
  resources :reports
  resources :addons
  resources :customers
  resources :sales
  resources :exceptions
  resources :stolen_cars
  resources :discounts
end
