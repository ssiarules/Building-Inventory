Rails.application.routes.draw do
  root 'sessions#index'

  get '/login', to: "sessions#new"
  post '/login', to:"sessions#create"

  delete '/logout', to: "sessions#destroy"  #making a delete action, the logout clickable on the page

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

  post '/products/new', to: "products#new"

  resources :users
  resources :products
  resources :buildings
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
