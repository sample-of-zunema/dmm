Rails.application.routes.draw do

  # ActiveAdminのルートの基本設定
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'homes#top'
  get 'homes/about'

  # deviseのルート基本設定
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }

  # deviseのルート基本設定
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  # usersのルート
  get 'users/unsubscribe'
  patch 'users/withdraw'
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]

  # dreamsのルート
  get 'dreams/top'
  resources :dreams do
    get :search, on: :collection
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  # 問い合わせのルート
  get   'inquiry'         => 'inquiry#index'     # 入力画面
  post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面

  # ブラウザバックの連続プッシュなどでページ更新がうまくいかない場合にサイトトップへいくルート設定
  get '*path', controller: 'homes', action: 'top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end