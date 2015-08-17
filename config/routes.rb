Rails.application.routes.draw do

#user sign up
get "/signup", to: "users#new"
get "/profile", to: "users#show"
resources :users


# Session/login routes
get "/login", to: "sessions#new"
get "/logout", to: "sessions#destroy"
resources :sessions

root "site#index"

end
