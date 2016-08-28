Rails.application.routes.draw do
  root "exhibits#index"
  devise_for :users, :controllers => { :sessions => 'users/sessions'
}
  resources :exhibits, only: [:show]
  resources :users, only: [:show, :update]
  resources :buyings, only: [:show, :new]
  resources :profiles, only: [:edit]

end
