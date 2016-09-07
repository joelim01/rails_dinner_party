Rails.application.routes.draw do

  resources :ingredients, only: [:create, :show, :edit, :update]

  resources :dinners do
    resources :images
    resources :comments
    resources :reservations
  end

  resources :dishes, only: [:index, :create, :new] do
    resources :images
    resources :comments
  end

  post "/dishes" => redirect("admin/dishes")
  patch "/dishes" => redirect("admin/dishes")

  resources :users, only: [:edit, :update] do
    resources :dishes, only: [:index]
    resources :reservations
  end

  namespace :admin do
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    resources :dinners
    resources :dishes
    resources :images
    resources :reservations
    resources :users
  end

  resources :reservations, only: [:edit]

  root to: 'dinners#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
