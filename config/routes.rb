Rails.application.routes.draw do
  resources :events, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :reviews, only: [:index, :show]
  resources :registrations, only: [:index, :show]

  root "events#index"
end
