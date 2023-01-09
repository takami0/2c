Rails.application.routes.draw do

  #--public--
  devise_for :users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  devise_scope :user do
    post "users/sign_in/guest" => "public/sessions#guest_login", as: "user_session_guest"
  end
  root 'public/homes#top', as: 'public_top'
  scope module: :public do
    get "search" => "homes#search"
    delete "users/guest_destroy" => "homes#guest_destroy", as: "guest_destroy"
    resources :users, only: [:index, :show, :edit, :update] do
      resource :follow, only: [:create, :destroy]
      resources :followings, only: [:index]
      resources :followers, only: [:index]
      resources :bookmarks, only: [:index]
      patch "notifications/update_all" => "notifications#update_all", as: "notifications_update"
      resources :notifications, only: [:index, :update]
    end
    resources :posts do
      resource :bookmark, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end


  #--admin--
  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    root "homes#top", as: "top"
    get "search" => "homes#search"
    resources :users, only: [:index, :show, :update] do
      resources :followings, only: [:index]
      resources :followers, only: [:index]
      resources :bookmarks, only: [:index]
    end
    resources :occupations, only: [:index, :create, :edit, :update, :destroy]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :category_media, only: [:index, :create, :edit, :update, :destroy]
    resources :category_styles, only: [:index, :create, :edit, :update, :destroy]
    resources :category_motifs, only: [:index, :create, :edit, :update, :destroy]
  end

end
