Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root "books#index"
  devise_for :users, controllers: { sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :user_details, only: [:new, :create, :edit, :update]
  resources :profiles, only: [:show]

  namespace :books do
    get "/database", to: "search#database"
  end

  resources :books, only: [:new, :show, :create] do
    resources :orders, only: [:new, :create, :show]
  end
end
