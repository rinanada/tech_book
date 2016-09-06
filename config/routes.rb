Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root "books#index"
  devise_for :users, :controllers => { sessions: 'users/sessions' }
  resources :user_details, only: [:new, :edit, :update]
  resources :profiles, only: [:show]

  resources :books, only: [:new, :show, :create] do
    resources :orders, only: [:new, :create, :show]
  end


  resources :sellings, only: [:new, :show, :create]

  # namespace :orders do
  #   resources :books
  # end

end
