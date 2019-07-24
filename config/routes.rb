Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  resources :pages
  resources :sellers
  resources :buyers
  resources :categories
  resources :sales
  resources :products

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'signup', to: 'pages#signup'

  get 'products', to: 'products#index'
  get 'sales', to: 'sales#index'
  get 'purchases', to: 'buyers#index'
  get 'categories', to: 'categories#index'
  get 'about', to: 'pages#about'
end
