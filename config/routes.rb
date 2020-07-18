Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'items#index'
  resources :items
  get 'categories/get_child', to: "categories#get_child"
end
