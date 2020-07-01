Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  post 'posts', to: 'posts#create'
  
end
