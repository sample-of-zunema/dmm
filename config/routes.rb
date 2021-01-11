Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  get 'users/unsubscribe'
  patch 'users/withdraw'
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]

  get 'dreams/top'
  resources :dreams do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end