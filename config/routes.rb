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
  resources :callboards
  resources :marquees
  resources :users do
    member do
      patch :add_diamond
      patch :add_diamond_info
      get :manager_info
      get :hongbao
    end
  end
  resources :tbl_playerinfos do
    member do
      patch :diamond
    end
  end

  namespace :api, :default => { :format => :json} do
    namespace :game do
      post "/users/:setUserBind" => "users#bind_user"
      get "/users/:getUserBindInfo" => "users#get_bind"
      patch "/users/:shareActivity" => "users#share_activity"
      post "/callboards/:getOneSystemNews" => "callboards#get_news"
      post "/marquees/:getPaomatiao" => "marquees#get_paomatiao"

      get "/playerinfos/:searchPlayer" => "playerinfos#search_player"
      delete "/playerinfos/:destroyPlayer" => "playerinfos#destroy_player"
      post "/playerinfos/:addPlayer" => "playerinfos#add_player"
      get "/:searchRequest" => "playerinfos#search_request"
      post "/:dealwithRequest" => "playerinfos#deal_request"
      post "players/:addTargetPlayer" => "playerinfos#add_target_player"
      get "players/:getPhoneList" => "playerinfos#get_phone_list"
    end
  end

end
