Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:new] 

  resources :purchases do
    collection do
      get :confirm
      # post :confirm ←あとでこっちにする
    end
  end
end
