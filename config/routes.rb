Rails.application.routes.draw do

  resources :ingredients, only: [:create, :show, :edit, :update]

  resources :dinners do
    resources :images
    resources :comments
    resources :reservations
  end

  resources :dishes do
    resources :images
    resources :comments
  end


  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
