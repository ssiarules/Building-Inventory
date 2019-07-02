Rails.application.routes.draw do
  root 'buildings#index'

  get 'login' => "buildings#new"
  post 'login' =>"buildings#create"

  get 'signup' => "users#new"
  post 'signup' =>"users#create"

  resources :users
  resources :products
  resources :floors
  resources :buildings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
