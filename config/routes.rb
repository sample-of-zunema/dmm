Rails.application.routes.draw do
  get 'dreams/new'
  get 'dreams/create'
  get 'dreams/index'
  get 'dreams/show'
  get 'dreams/edit'
  get 'dreams/update'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/unsubscribe'
  get 'users/withdraw'
  get 'homes/top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
