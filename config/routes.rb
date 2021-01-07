Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about'

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  get 'users/unsubscribe'
  get 'users/withdraw'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  get 'dreams/top'
  resources :dreams, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
