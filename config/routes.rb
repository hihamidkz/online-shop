Rails.application.routes.draw do
  resources :line_items
  resources :carts
  devise_for :users
  get 'persons/profile'
  resources :books
  get 'store/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'
  get 'persons/profile', as: 'user_root'
end
