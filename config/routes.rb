Rails.application.routes.draw do
  get 'opinions/index'
  get 'opinions/new'
  get 'opinions/create'
  get 'opinions/show'
  get 'opinions/edit'
  get 'opinions/update'
  get 'opinions/destroy'
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
