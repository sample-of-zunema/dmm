Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about'
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  get 'users/unsubscribe'
  patch 'users/withdraw'
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]

  get 'dreams/top'
  resources :dreams do
    get :search, on: :collection
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end