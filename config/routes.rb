Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
   omniauth_callbacks: 'users/omniauth_callbacks',
   registrations: 'users/registrations'
  }
  resources :prices, only:[:new,:create,:show]
  resources :admins, only:[:show,:index]
  resources :beginners, only:[:index]
  resources :categories, only:[:index]
  root to: 'preschools#index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users, only: [:show] do
    get :likes, on: :collection
  end
  get 'search', to: 'preschools#search'
  resources :preschools do
    resources :comments, only:[:create,:edit,:update,:destroy]
    resource :likes, only:[:create,:destroy]
  end
end
