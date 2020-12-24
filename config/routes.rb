Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
   omniauth_callbacks: 'users/omniauth_callbacks',
   registrations: 'users/registrations'
  }
  root to: 'preschools#index'
  resources :users, only: :show
  resources :admins, only: :show
  resources :preschools do
    resources :comments, only:[:create,:edit,:update,:destroy]
    resource :likes, only:[:create,:destroy]
  end
end
