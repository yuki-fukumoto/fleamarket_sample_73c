Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: :show
  resources :items, expect: :index
  
  resources :purchases do
    collection do
      post :confirm 
    end
  end
end
