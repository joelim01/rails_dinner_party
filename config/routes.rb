Rails.application.routes.draw do
  authenticate :user do

    resources :ingredients, only: [:create, :edit, :update]

    resources :dinners do
      resources :comments, only: [:create, :edit, :update]
      resources :reservations, only: [:create, :destroy, :new, :update]
    end

    resources :dishes, only: [:index] do
      resources :comments
    end

    resources :users, only: [:edit, :update] do
      resources :dishes, only: [:index]
      resources :reservations, only: [:index, :show, :create, :update]
    end

    namespace :admin do
      # Directs /admin/products/* to Admin::ProductsController
      # (app/controllers/admin/products_controller.rb)
      resources :dinners
      resources :dishes
      resources :reservations
      resources :users
    end

    resources :reservations, only: [:edit]

  end

  root to: 'dinners#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: 'registrations'  }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
