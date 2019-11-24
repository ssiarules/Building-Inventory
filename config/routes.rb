Rails.application.routes.draw do
  root 'sessions#index'

  #LOGINS 
  get '/login', to: "sessions#new"
  post '/login', to:"sessions#create"
  delete '/logout', to: "sessions#destroy"  #making a delete action, the logout clickable on the page

  #SIGNUPS 
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"


    #OMNIAUTH CALLBACKS 
  get '/auth/github/callback', to: 'sessions#omniauth_create'
  get '/auth/facebook/callback', to: 'sessions#omniauth_create'
  get '/auth/failure', to: 'sessions#index'
  get '/auth/failure', to: "sessions/#index"

  #BUILDINGS 
  get '/buildings/', to: 'buildings#index'
  post '/buildings/new', to: 'buildings#new'
  delete '/buildings/id', to: 'buildings#destroy'
  
  #PRODUCTS  
  get '/products/id', to: 'products#edit'
  post '/products/new', to: "products#new"
  delete '/products/id', to: 'products#destroy'
  


  resources :users
  resources :products do 
    resources :buildings, only: [:index, :new, :create] #only use [:index, :new, :create] for nested. The only we will have the unshallow routes edit, show, delete, update is if we need to get the params hash, but we can already get it from the active record relationships so we don’t need the id and params hash.                                                          
  end
  resources :buildings do
    resources :products 
  end 
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
