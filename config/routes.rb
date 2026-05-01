Rails.application.routes.draw do
  root "pages#home"

  get "categories", to: "pages#categories"
  get "login", to: "pages#login"
  get "signup", to: "pages#signup"

  resources :events, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :registrations, only: [:index, :show]
  resources :reviews, only: [:index, :show]
end