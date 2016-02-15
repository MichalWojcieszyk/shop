Rails.application.routes.draw do
  
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  get 'users/show'
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  
  devise_for :users
  #get 'user/:id' => 'users#show'
  resources :users
  

  root 'categories#index'
end