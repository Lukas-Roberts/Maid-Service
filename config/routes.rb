Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout', as: 'logout'

  resources :accounts, only: [:new, :create]
  resources :maids, only: [:new, :create, :edit, :show]
  resources :clients, only: [:new, :create, :edit, :show]

  root 'sessions#new'
end
