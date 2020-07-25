Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'items#index'
  resources :items, except: :index
  get 'categories/get_child', to: "categories#get_child"

  resources :creditcards, only: [:new, :create]

  resources :purchases do
    collection do
      get :confirm
    end
  end
end
