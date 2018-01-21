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
      post "/users/:setUserBind" =>                       "users#bind_user"
      get "/users/:getUserBindInfo" =>                    "users#get_bind"
      patch "/users/:shareActivity" =>                    "users#share_activity"
      post "/callboards/:getOneSystemNews" =>             "callboards#get_news"
      get "/marquees/:getPaomatiao" =>                   "marquees#get_paomatiao"

      get "/playerinfos/:searchPlayer" =>                 "friends#search_player"
      delete "/playerinfos/:deletePlayer" =>              "friends#destroy_player"
      post "/playerinfos/:addPlayer" =>                   "friends#add_player"
      get "/:searchRequest" =>                            "friends#search_request"
      post "/:dealwithRequest" =>                         "friends#deal_request"
      post "players/:addTargetPlayer" =>                  "friends#add_target_player"
      get "players/:getPhoneList" =>                      "friends#get_phone_list"
      get "gamers/:searchGamer" =>                        "friends#search_playerinfo"
      post "/groups/:createGroup" =>                      "playerinfos#create_group"
      get "groups/:searchGroup" =>                        "playerinfos#search_group"
      get "grouplists/:search_grouplist" =>               "playerinfos#search_grouplist"
      patch "groups/:joinGroup" =>                        "playerinfos#join_group"
      get "groupinfos/:getGroupinfo" =>                   "playerinfos#get_groupinfo"
      get "groupPlayers/:getGroupPlayer" =>               "playerinfos#get_group_player"
      delete "groupPlayers/:deleteGroupPlayer" =>         "playerinfos#delete_group_player"
      delete "group/:quitGroup" =>                        "playerinfos#quit_group"
      delete "groups/:disbandGroup" =>                    "playerinfos#disband_group"
      get "groupRequests/:search_groupRequest" =>         "playerinfos#search_groupRequest"
      get "groupQuitRequests/:search_groupQuitRequest" => "playerinfos#search_quit_request"
      post "groupRequests/:dealwithRequest" =>            "playerinfos#deal_group_request"
      #第一个项目的支付接口
      get "pay/:pay_notify" => "pays#get_notify"
      post "pay/:pay_callback" => "pays#pay_callback"
    end
  end

end
