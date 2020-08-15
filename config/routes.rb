Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users, only: :show

  root 'items#index'
  resources :items do
    resources :comments, only: :create
  end
  resources :items, except: :index do
    collection do
      get 'search'
    end
  end

  get 'categories/get_child', to: "categories#get_child"


  resources :creditcards, only: [:new, :create, :show, :destroy]

  resources :purchases, only: :create do
    member do
      get :confirm
    end
  end
end
