Rails.application.routes.draw do
  namespace :admin do
    get 'category_motifs/index'
    get 'category_motifs/edit'
  end
  namespace :admin do
    get 'category_styles/index'
    get 'category_styles/edit'
  end
  namespace :admin do
    get 'category_media/index'
    get 'category_media/edit'
  end
  namespace :admin do
    get 'posts/index'
    get 'posts/show'
  end
  namespace :admin do
    get 'occupations/index'
    get 'occupations/edit'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/new'
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :public do
    get 'users/my_page'
    get 'users/quit'
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'homes/top'
  end
  get 'homes/top'
  devise_for :admin, controllers: {
        sessions: 'admin/sessions'
      }

  devise_for :users, controllers: {
        sessions: 'public/sessions',
        registrations: 'public/registrations',
      }
end
