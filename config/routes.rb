Rails.application.routes.draw do
  devise_for :users
  root "pages#home"

#  get "categories", to: "pages#categories"
  #get "login", to: "pages#login"
  #get "signup", to: "pages#signup"
  get "profile", to: "pages#profile"


  resources :events do
    resources :reviews
    resources :event_registrations, only: [:new, :create, :destroy]
  end

  resources :events
  resources :categories
  resources :venues
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :event_registrations
  resources :reviews
end