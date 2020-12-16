Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :preschools
  root to: 'preschools#index'
end
