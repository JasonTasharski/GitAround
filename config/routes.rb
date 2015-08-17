Rails.application.routes.draw do

  get 'items/new'

  get 'items/create'

  get 'items/destroy'

  get 'items/edit'

  get 'items/update'

#user sign up
get "/signup", to: "users#new"
get "/profile", to: "users#show"
resources :users do 
  resources :itineraries
end


# Session/login routes
get "/login", to: "sessions#new"
get "/logout", to: "sessions#destroy"
resources :sessions



root "site#index"

end

