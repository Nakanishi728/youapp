Rails.application.routes.draw do
  namespace :v1 do
    resources :users do
      member do
        patch '/update_avatar', to: 'users#update_avatar'
        get :following, :followers
      end
    end
    resources :posts, only: [:index, :show, :create, :update, :destroy] do
      member do
        get :postlists
      end
    end
    resources :likes, only: [:index, :create, :destroy]
    get 'pickups/:id', to: 'pickups#index'
    post 'pickups/:id', to: 'pickups#create'
    resources :relationships, only: [:create]
    delete 'relationships', to: 'relationships#destroy'
  end
 end
 