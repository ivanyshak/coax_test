Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root 'bicycles#index'
  get 'home/profile'

  resources :bicycles
end
