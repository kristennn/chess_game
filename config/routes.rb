Rails.application.routes.draw do
  root 'tbl_accounts#index'

  resources :tbl_rooms
  resources :tbl_accounts
end
