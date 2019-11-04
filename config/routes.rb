Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout', as: 'logout'
  get 'auth/google_oauth2/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
  patch '/choose', to: 'accounts#choose', as: 'choose'

  resources :accounts, only: [:new, :create]
  resources :maids, only: [:new, :create, :edit, :show, :update]
  resources :clients, only: [:new, :create, :edit, :show, :update]
  resources :residences, only: [:new, :create, :edit, :show, :update]
  resources :schedules, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :clients, only: [:show] do
    resources :residences, only: [:show] do
      resources :schedules, only: [:new, :create]
    end
  end

  resources :clients, only: [:show] do
    resources :schedules, only: [:index]
  end

  root 'sessions#new'
  
end
