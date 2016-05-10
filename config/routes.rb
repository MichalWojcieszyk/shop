Rails.application.routes.draw do
  
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end
    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  resources :categories do
    resources :products do
      resources :reviews, only: [:new, :create]
      resources :payments, only: [:new, :create]
    end
  end

  get 'products', to: 'products#index'

  resources :products do
    member do
      put 'like' => 'products#upvote'
      put 'unlike' => 'products#downvote'
    end
  end
    
  devise_for :users

  resources :users, only: [:show, :edit, :update]
  resources :deposits, only: [:new, :create]
  
  root 'categories#index'
end
