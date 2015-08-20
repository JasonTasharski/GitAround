Rails.application.routes.draw do

  get 'about/show'

root "itineraries#index"

#user sign up
get "/signup", to: "users#new"
resources :users do 
  resources :itineraries 
end

resources :itineraries do 
	get 'clone'
end

resources :itineraries do 
    resources :items
end

# Session/login routes
get "/login", to: "sessions#new"
get "/logout", to: "sessions#destroy"
resources :sessions



#              Prefix Verb   URI Pattern                                         Controller#Action
#              signup GET    /signup(.:format)                                   users#new
#    user_itineraries GET    /users/:user_id/itineraries(.:format)               itineraries#index
#                     POST   /users/:user_id/itineraries(.:format)               itineraries#create
#  new_user_itinerary GET    /users/:user_id/itineraries/new(.:format)           itineraries#new
# edit_user_itinerary GET    /users/:user_id/itineraries/:id/edit(.:format)      itineraries#edit
#      user_itinerary GET    /users/:user_id/itineraries/:id(.:format)           itineraries#show
#                     PATCH  /users/:user_id/itineraries/:id(.:format)           itineraries#update
#                     PUT    /users/:user_id/itineraries/:id(.:format)           itineraries#update
#                     DELETE /users/:user_id/itineraries/:id(.:format)           itineraries#destroy
#               users GET    /users(.:format)                                    users#index
#                     POST   /users(.:format)                                    users#create
#            new_user GET    /users/new(.:format)                                users#new
#           edit_user GET    /users/:id/edit(.:format)                           users#edit
#                user GET    /users/:id(.:format)                                users#show
#                     PATCH  /users/:id(.:format)                                users#update
#                     PUT    /users/:id(.:format)                                users#update
#                     DELETE /users/:id(.:format)                                users#destroy
#     itinerary_items GET    /itineraries/:itinerary_id/items(.:format)          items#index
#                     POST   /itineraries/:itinerary_id/items(.:format)          items#create
#  new_itinerary_item GET    /itineraries/:itinerary_id/items/new(.:format)      items#new
# edit_itinerary_item GET    /itineraries/:itinerary_id/items/:id/edit(.:format) items#edit
#      itinerary_item GET    /itineraries/:itinerary_id/items/:id(.:format)      items#show
#                     PATCH  /itineraries/:itinerary_id/items/:id(.:format)      items#update
#                     PUT    /itineraries/:itinerary_id/items/:id(.:format)      items#update
#                     DELETE /itineraries/:itinerary_id/items/:id(.:format)      items#destroy
#         itineraries GET    /itineraries(.:format)                              itineraries#index
#                     POST   /itineraries(.:format)                              itineraries#create
#       new_itinerary GET    /itineraries/new(.:format)                          itineraries#new
#      edit_itinerary GET    /itineraries/:id/edit(.:format)                     itineraries#edit
#           itinerary GET    /itineraries/:id(.:format)                          itineraries#show
#                     PATCH  /itineraries/:id(.:format)                          itineraries#update
#                     PUT    /itineraries/:id(.:format)                          itineraries#update
#                     DELETE /itineraries/:id(.:format)                          itineraries#destroy
#               login GET    /login(.:format)                                    sessions#new
#              logout GET    /logout(.:format)                                   sessions#destroy
#            sessions GET    /sessions(.:format)                                 sessions#index
#                     POST   /sessions(.:format)                                 sessions#create
#         new_session GET    /sessions/new(.:format)                             sessions#new
#        edit_session GET    /sessions/:id/edit(.:format)                        sessions#edit
#             session GET    /sessions/:id(.:format)                             sessions#show
#                     PATCH  /sessions/:id(.:format)                             sessions#update
#                     PUT    /sessions/:id(.:format)                             sessions#update
#                     DELETE /sessions/:id(.:format)                             sessions#destroy
#                root GET    /



end

