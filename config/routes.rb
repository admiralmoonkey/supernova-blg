# Rails.application.routes.draw do
#   devise_for :users
#
#   resources :users
#
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   get "welcome/index"
#
#   resources :articles do
#     resources :comments
#   end
#
# end
Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :articles do
    resources :comments
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
