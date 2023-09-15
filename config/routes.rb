Rails.application.routes.draw do
  namespace :admin do
    get 'genres/new'
    get 'genres/edit'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'posts/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'bookmarks/index'
  end
  namespace :public do
    get 'records/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :public do
    get 'homes/top'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
