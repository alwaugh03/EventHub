Rails.application.routes.draw do
  devise_for :users
  root "pages#home"

#  get "categories", to: "pages#categories"
  get "login", to: "pages#login"
  get "signup", to: "pages#signup"


  resources :events do
    resources :reviews
    resources :registrations, only: [:new, :create, :destroy]
  end

  resources :events
  resources :categories
  resources :venues
  resources :users, only: [:index, :show]
  resources :registrations
  resources :reviews
end