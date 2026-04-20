Rails.application.routes.draw do

  root "pages#home"

  get "events", to: "pages#events"
  get "categories", to: "pages#categories"
  get "login", to: "pages#login"
  get "signup", to: "pages#signup"

end
