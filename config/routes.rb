Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  get 'categories/get_child', to: "categories#get_child"
end
