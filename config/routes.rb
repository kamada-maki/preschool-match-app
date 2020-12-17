Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'preschools#index'

  resources :preschools do
    resources :comments, only:[:create,:edit,:update,:destroy]
  end
end
