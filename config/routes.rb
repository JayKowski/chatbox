Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :tweets
  
  resources :tweets, only: [:index, :create] do
    resources :replies, only: [:create]
  end

  root 'sessions#new'

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'tweets/new', to: 'tweets#new'
  post 'tweets/new', to: 'tweets#create'

  get 'new_follower', to: 'follows#new'
  post 'new_follower', to: 'follows#create'

  delete 'unfollow', to: 'follows#destroy'
end
