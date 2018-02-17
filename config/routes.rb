Rails.application.routes.draw do

  resources :members
  resources :branches
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated do
    root :to => "credit_unions#index", as: :authenticated
  end

  root to: "page#home"

  # get "/home", to: "page#home"

  devise_for :users
  # devise_for :users, controllers: {
  #   sessions: "users/sessions",
  #   registrations: "users/registrations"
  # }

  resources :credit_unions
  # devise_scope :user do
  #   resources :users, controller: "users/registrations"
  #   get "users/new", to: "users#new"
  # end
  resources :users

 end
