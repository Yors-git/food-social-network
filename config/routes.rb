Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'delete', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  resources :users
  resources :users do
    member do
      get :create_follower
      get :delete_follower
    end
  end
  resources :opinions

  root 'opinions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
