Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

# ユーザー情報関連のルーティング
  resources :users, only: [:show, :edit, :update] do
    # ユーザーが投稿した記事一覧のルーティング
    member do
      get 'posts', to: 'users#posts'
    end
  end

  # 投稿関連のルーティング
  resources :posts do
    # コメント関連のルーティング
    resources :comments, only: [:create, :destroy]
  end

  # 投稿検索関連のルーティング
  get '/search', to: 'posts#search', as: 'search'

  # about画面
  get '/about', to: 'pages#about'

  # 投稿編集と削除のルーティング
  get '/posts/:id/edit', to: 'posts#edit'
  patch '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#destroy'

  # コメント削除のルーティング
  delete '/comments/:id', to: 'comments#destroy', as: 'comment_destroy'

  # 投稿詳細画面のルーティング
  get '/spots/:id', to: 'spots#show', as: 'spot'

  # ユーザー情報画面のルーティング
  get '/users/:id', to: 'users#show', as: 'user_info'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
