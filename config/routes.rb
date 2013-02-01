StaffwiselyV2::Application.routes.draw do
  devise_for :users
  match 'dashboard' => 'dashboard#index', :as => 'user_root'

  root :to => 'home#index'

  resources :dashboard
  resources :jobs
  resources :projects
  resources :proposals
end
