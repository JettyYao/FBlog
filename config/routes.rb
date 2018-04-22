Rails.application.routes.draw do
  
  root 'static_pages#index'
  get '/about',to:'static_pages#about'
  get '/sign',to:'users#new'
  post '/sign',to:'users#create'
  get '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  delete '/logout',to:'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new,:create,:edit,:update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end