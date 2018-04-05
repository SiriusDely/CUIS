Rails.application.routes.draw do

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
  # devise_scope :user do
  #   resources :users, controller: "users/registrations"
  #   get "users/new", to: "users#new"
  # end
  resources :users
  resources :credit_unions
  resources :branches
  resources :members
  resources :accounts
  # resources :transactions, controller: "transfers"
  # resources :transfers, path: "transactions", as: "transactions"
  resources :transfers, path: "transactions"
  resources :share_products
  resources :share_accounts
  resources :share_statements
  resources :saving_products
  resources :saving_accounts
  resources :saving_statements
  resources :income_sources
  resources :expense_allocations

 end
