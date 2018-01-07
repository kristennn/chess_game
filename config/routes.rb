Rails.application.routes.draw do

  root 'tbl_accounts#index'
  get '/saler_overview', to: 'users#saler_overview'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/saler_info', to: 'users#saler_info'
  get 'player_info', to: 'users#player_info'
  get 'money_info', to: 'users#money_info'


  resources :tbl_rooms
  resources :tbl_accounts
  resources :tbl_systems
  resources :tbl_player_fees
  resources :users do
    member do
      patch :add_diamond
      patch :add_diamond_info
    end
  end
  resources :tbl_playerinfos do
    member do
      patch :diamond
    end
  end

end
