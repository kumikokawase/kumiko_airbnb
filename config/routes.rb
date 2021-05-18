Rails.application.routes.draw do

  get 'properties/new'
  get 'properties/edit'
  get '/rooms', to: 'properties#new', as: :properties_new_path

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :properties, only: [:new, :create, :destroy, :show, :update]

  root 'static_pages#home'
  
  get 'static_pages/home'

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  
end
