Rails.application.routes.draw do
  root "exhibits#index"
  devise_for :users, :controllers => { sessions: 'users/sessions' }
  resources :exhibits, only: [:show]
  resources :users, only: [:new, :edit, :update, :create]
  resources :buyings, only: [:show, :new, :update, :create]
  resources :profiles, only: [:show]

end
