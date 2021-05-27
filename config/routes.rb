Rails.application.routes.draw do

  get '/your_reservations', to:'reservations#your_reservations'
  get '/your_trips', to:'reservations#your_trips'

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

  resources :reviews, only: [:create, :destroy]
  get 'review', to: 'review#new'
end
