Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users, only: :show
  root 'items#index'
  resources :creditcards, only: [:new, :create, :edit]
  
  get 'users', to: "users#show"
  get 'categories/get_child', to: "categories#get_child"
  resources :items, except: :index do
    collection do
      get 'search'
    end
  end  

  resources :creditcards, only: [:new, :create]

  resources :purchases, only: :create do
    member do
      get :confirm 
    end
  end
end
