Rails.application.routes.draw do

  get 'properties/new'
  get 'properties/edit'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :properties, only: [:new, :create, :destroy, :update]

  resources :properties do 
    member do
      get 'listing'
      get 'pricing'
    end
  end

  root 'static_pages#home'
  
  get 'static_pages/home'

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  
end
