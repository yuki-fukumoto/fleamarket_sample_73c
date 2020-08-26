Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users, only: [:show] do
    collection do
      get 'sale_items'
      get 'sold_items'
    end
  end  

  root 'items#index'
  resources :items do
    resources :comments, only: [:create, :new]
  end
  resources :items, except: :index do
  end  

  resources :searches do
    collection do
      get 'detail_search'
    end
  end

  get 'categories/get_child', to: "categories#get_child"


  resources :creditcards, only: [:new, :create, :show, :destroy]

  resources :purchases, only: :create do
    member do
      get :confirm
    end
  end

  resources :browsing_histories
end
