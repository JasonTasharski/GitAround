Rails.application.routes.draw do

#user sign up
get "/signup", to: "users#new"
resources :users do 
  resources :itineraries 
end

resources :itineraries do 
    resources :items
end




# Session/login routes
get "/login", to: "sessions#new"
get "/logout", to: "sessions#destroy"
resources :sessions



root "itineraries#index"

end

