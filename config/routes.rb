Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :posts do
    resources :comments, only: %i[create edit update destroy]
    resources :likes, only: %i[create destroy]
  end
  resources :user, only: %i[index show]
  get 'search', to: 'user#search'
  resources :stories, only: %i[new create destroy show]
  resources :requests, only: %i[create update destroy]
  resources :follower, only: %i[create destroy]
end
