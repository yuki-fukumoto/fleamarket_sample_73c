Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/edit'
  devise_for :users
  root 'top_page#index'
  resources :items, expect: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:new] 

  resources :purchases do
    collection do
      post :confirm 

      resources :categories, only: [:index] do
        member do
          get 'parent'
          get 'child'
          get 'grandchild'

  resources :items do 
  #Ajaxで動くアクションのルートを作成
    collection do
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
            end
          end
        end
      end
    end
  end
end
