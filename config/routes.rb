Rails.application.routes.draw do
  get 'pages/about'

  get 'pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/farmers', to: 'farmers#index'
  get '/farmers/:id', to: 'farmers#show', as: 'farmer'
  post '/cart/:id', to: 'cart#add'
  get '/cart', to: 'cart#index'
  resources :users, only: [:create, :new, :show, :edit, :update]
  resources :products
end
