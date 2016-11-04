Rails.application.routes.draw do
  devise_for :users

  get "cart" , to: "carts#index"
  delete "cart" , to: "carts#destroy"

  resources :products do
    get "cart" , to: "carts#create"
    delete "cart" , to: "carts#eject"
  end

  resources :orders

  root "products#index"
end
