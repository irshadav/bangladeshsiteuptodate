Rails.application.routes.draw do

  resources :posts
  resources :locations

root 'home#index'
devise_for :users
resources :users

end
