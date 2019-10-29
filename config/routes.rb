Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout', as: 'logout'

  resources :accounts, only: [:new, :create]
  resources :maids, only: [:new, :create, :edit, :show, :update]
  resources :clients, only: [:new, :create, :edit, :show, :update]
  resources :residences, only: [:new, :create, :edit, :show, :update]
  resources :schedules, only: [:new, :create, :edit, :show, :update]

  root 'sessions#new'
end
