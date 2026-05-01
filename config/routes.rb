Rails.application.routes.draw do
  root "events#index"

  resources :events, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :registrations, only: [:index, :show]
  resources :reviews, only: [:index, :show]
end