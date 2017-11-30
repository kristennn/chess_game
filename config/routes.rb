Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root 'tbl_accounts#index'

  resources :tbl_rooms
  resources :tbl_accounts
  resources :tbl_systems
  resources :tbl_logs
  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'user#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
