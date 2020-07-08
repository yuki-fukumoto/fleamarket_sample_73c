Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:new] 

  resources :purchases do
    collection do
      post :confirm 
    end
  end
end
