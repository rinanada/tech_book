Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root "books#index"
  devise_for :users, :controllers => { sessions: 'users/sessions' }
  resources :user_details, only: [:new, :edit, :update]
  resources :profiles, only: [:show]

  resources :books, only: [:show]
  resources :buyings, only: [:new, :show]
  resources :sellings, only: [:new, :show, :create]

end
