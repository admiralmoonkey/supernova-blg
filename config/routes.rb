Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout'}
  resources :users
  resources :articles do
    resources :comments
  end

  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
