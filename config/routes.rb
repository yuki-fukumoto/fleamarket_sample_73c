Rails.application.routes.draw do
  devise_for :users

  root 'top_page#index'
  

  root 'items#index'
  resources :items, only: [:new] 

end
