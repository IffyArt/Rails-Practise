Rails.application.routes.draw do
  get 'shopping_carts/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :product_manages, only: [:index, :destroy] do
    resources :product_pictures, only: [:new, :create, :destroy, :update]
  end
  resources :kinds, except: [:show]
  resources :user_manages, only: [:index, :show]
  resources :products, only: [:index, :show, :edit, :update, :new, :create] do
    member do
      post :shopping_cart
    end
  end
  resources :shopping_carts, only: [:index, :destroy, :create]
  resources :orders, except: [:new, :create]

  root to: 'products#index'
end
