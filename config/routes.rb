Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'places#index'


  resources :places do
    resources :comments, only: :create
    resources :photos, only: :create
    resources :likes, only: :create
  end
  
  resources :comments
  
  resources :photos

  resources :likes, only: :destroy


  patch '/users/:id/avatar(.:format)', to: 'users#setavatar', as: 'set_user_avatar'
  get '/users/:id/my_favorites(.:format)', to: 'users#my_favorites', as: 'user_my_favorites'
  resources :users, only: [:show]

  get '/about', to: 'misc#about', as: 'about'
end
