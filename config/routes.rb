Rails.application.routes.draw do

  resources :pictures
  get 'properties/new'
  get 'properties/edit'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :properties

  resources :properties do 
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'amenities'
      get 'location'
      get 'photos'
    end
  end

  resources :reservations, only: [:create]

  root 'static_pages#home'
  
  get 'static_pages/home'

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  
end
