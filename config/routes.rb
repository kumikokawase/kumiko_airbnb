Rails.application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get '/signup', to: 'users#new'
  root 'static_pages#home'
  
  get 'static_pages/home'

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  
end
