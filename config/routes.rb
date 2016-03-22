Rails.application.routes.draw do
  
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  resources :categories do
    resources :products, only: [:edit, :update, :destroy, :show, :new, :create] do
      resources :reviews
    end
  end
  get 'products', to: 'products#index'
  
  devise_for :users
  resources :users, only: :show
  
  root 'categories#index'
end