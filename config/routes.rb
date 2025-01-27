Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get 'home/about' => 'homes#about',as: 'about'
  devise_for :users
  get '/search' => 'searchs#search'

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
  end

  get ':id/followings' => 'users#followings', as: 'followings'
  get ':id/followers' => 'users#followers', as: 'followers'
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
