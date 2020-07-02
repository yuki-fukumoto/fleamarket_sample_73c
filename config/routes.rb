Rails.application.routes.draw do
  get 'posts', to: 'messages#index'
end
