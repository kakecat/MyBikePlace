Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

# ユーザー側
namespace :user do
  # トップページを投稿一覧へ
  root to: "spots#index"
  # ホーム
  get '/about' => 'homes#about', as: 'about'
  # 投稿
  resources :posts, only: [:edit, :update, :create, :new, :destroy, :show]
  # ユーザー情報
  get 'users/my_page' => 'users#show'
  get 'users/information/edit' => 'users#edit'
  patch 'users/my_page' => 'users#update'
  get 'users/check' => 'users#check'
  patch 'users/withdraw' => 'users#withdraw'
  # 投稿一覧・検索
  resources :spots, only: [:search]
  # いいね
  resources :favorites, only: [:create, :destroy]
  # コメント
  resources :comments, only: [:create, :destroy]
  # フォロー
  resources :follows, only: [:create, :destroy]

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end