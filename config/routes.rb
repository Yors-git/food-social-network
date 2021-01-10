Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'delete', to: 'sessions#destroy'
  resources :users
  resources :opinions

  root 'opinions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
