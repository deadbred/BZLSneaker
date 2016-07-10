Rails.application.routes.draw do

  resources :sneakers

  resources :users

  resources :account_activations, only: [:edit]

  resources :password_resets,     only: [:new, :create, :edit, :update]

  root 'sneakers#index'

  get '/signup', to: 'users#new'

  get '/login',  to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

end
