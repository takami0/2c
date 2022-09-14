Rails.application.routes.draw do

  get 'notifications/index'
  devise_for :admin, controllers: {
        sessions: 'admin/sessions'
  }

  namespace :admin do
    get "top" => "homes#top", as: "top"

    patch "users/leave" => "users#leave", as: "leave"
    resources :users, only: [:index, :show, :edit, :update]
    resources :occupations, only: [:index, :create, :edit, :update]
    resources :posts, only: [:index, :show, :destroy]
    resources :category_media, only: [:index, :create, :edit, :update]
    resources :category_styles, only: [:index, :create, :edit, :update]
    resources :category_motifs, only: [:index, :create, :edit, :update]
  end


  devise_for :users, controllers: {
        sessions: 'public/sessions',
        registrations: 'public/registrations',
  }

  namespace :public do
    root "homes#top", as: "top"
    get "search" => "homes#search"
    get "users/my_page" => "users#my_page", as: "my_page"

    get "users/quit" => "users#quit", as: "quit"
    patch "users/leave" => "users#leave", as: "leave"

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

end
