Rails.application.routes.draw do
  root 'tasks#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :tasks, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
end
