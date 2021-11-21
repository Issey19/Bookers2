Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :edit, :show, :destroy]

  resources :users, only: [:show, :edit, :index, :update]


end