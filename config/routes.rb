Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'items#index'
  get 'categories/get_child', to: "categories#get_child"
  resources :items, except: :index do
    # collection do
    #   get 'search'
    # end
  end  

  resources :searches do
    collection do
      get 'detail_search'
    end
  end  

  resources :purchases do
    collection do
      post :confirm 
    end
  end
end
