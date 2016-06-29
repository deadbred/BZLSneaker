Rails.application.routes.draw do
  resources :sneakers

  root 'sneakers#index'
end
