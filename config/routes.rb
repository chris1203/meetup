Rails.application.routes.draw do
  resources :groups do
    member do
      post :join
      post :quit
    end
    resources :posts
  end
  namespace :account do
    resources :groups
    resources :posts
  end
  devise_for :user, controllers: {
   passwords: 'users/passwords',
   registrations: 'users/registrations',
   sessions: 'users/sessions'
 }
  root 'groups#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
