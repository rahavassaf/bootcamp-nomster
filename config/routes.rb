Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'places#index'
  resources :places do
    resources :comments, only: :create
    resources :photos, only: :create
  end
  
  resources :comments
  
  resources :photos


  patch '/users/:id/avatar(.:format)', to: 'users#setavatar', as: 'set_user_avatar'
  resources :users, only: [:show]
end
