Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'items#index'
  resources :items, except: :index do
  get 'categories/get_child', to: "categories#get_child"
    collection do
      get 'search'
    end
  end  

  resources :purchases do
    collection do
      post :confirm 
    end
  end
end
