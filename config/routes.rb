Rails.application.routes.draw do
  get 'users/sign_out'
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'items#index'
  resources :items, except: :index
  resources :creditcards, only: [:new, :create, :update, :edit]
  get 'categories/get_child', to: "categories#get_child"
  get 'users', to: "users#show"
  get 'users', to: "users#sign_out"
  resources :purchases do
    collection do
      post :confirm 
    end
  end
end
