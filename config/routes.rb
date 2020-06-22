Rails.application.routes.draw do
  get 'top_page/index'
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
