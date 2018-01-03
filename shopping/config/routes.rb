Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    resources :product_pictures, only: [:new, :create, :destroy]
  end
  resources :kinds, except: [:show]
  root to: 'products#index'
end
