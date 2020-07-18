Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'items#index'
  # post 'posts', to: 'posts#create'
  # root to: 'posts#index'
end
