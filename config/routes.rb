Rails.application.routes.draw do
  root 'sessions#index'

    #omniauth callback
  get '/auth/facebook/callback', to: "sessions#omniauth_login"


  get '/login', to: "sessions#new"
  post '/login', to:"sessions#create"

  delete '/logout', to: "sessions#destroy"  #making a delete action, the logout clickable on the page

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

  post '/products/new', to: "products#new"
  post '/buildings/new', to: "buildings#new"




  resources :users
  resources :products do 
    resources :buildings, only: [:index, :new, :create] #only use [:index, :new, :create] for nested. The only we will have the unshallow routes edit, show, delete, update is if we need to get the params hash, but we can already get it from the active record relationships so we don’t need the id and params hash.
                                                                      

  end
  resources :buildings
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
