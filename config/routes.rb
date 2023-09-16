Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top' #管理者トップページ
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do #管理者
    resources :posts, only: [:index, :show, :destroy] #投稿機能用
    resources :customers, only: [:index, :show, :edit, :update] #会員機能用
    resources :genres, only: [:index, :new, :create, :edit, :update] #ジャンル機能用
  end

  scope module: :public do #会員
    root to: "homes#top" #トップページ用
    resources :posts, only: [:index, :show, :new, :create, :edit, :update] #投稿機能用
    get "/customers/unsubscribe" => "customers#unsubscribe" #退会確認画面へのルーティング
    patch "/customers/withdraw" => "customers#withdraw" #退会処理へのルーティング
    resources :customers, only: [:show, :edit, :update] #会員機能用
    get 'records/index' #投稿履歴機能用
    resources :bookmarks, only: [:index, :create, :destroy] #ブックマーク機能用

  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
