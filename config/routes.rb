Rails.application.routes.draw do
  resources :branches
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated do
    root :to => "credit_unions#index", as: :authenticated
  end

  root to: "page#home"

  # get "/home", to: "page#home"

  devise_for :users

  resources :credit_unions
  resources :users

 end
