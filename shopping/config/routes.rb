Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :product_manages, only: [:index, :destroy] do
    resources :product_pictures, only: [:new, :create, :destroy, :update]
  end
  resources :kinds, except: [:show] do
    member do
      get :product
    end
  end
  resources :user_manages, only: [:index, :show]
  resource :user_manage, only: [:update]
  resources :products, only: [:index, :show, :edit, :update, :new, :create] do
    member do
      post :shopping_cart
    end
  end
  resources :shopping_carts, only: [:index, :destroy, :create]
  resources :orders, except: [:new, :create, :edit]

  post "/search", to: "products#search"
  root to: 'common#index'
end
