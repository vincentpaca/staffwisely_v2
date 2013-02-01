StaffwiselyV2::Application.routes.draw do
  resources :dashboard
  resources :jobs
  resources :projects
  resources :proposals

  devise_for :users, :controllers => { :registrations => "registrations" }
  match 'dashboard' => 'dashboard#index', :as => 'user_root'
  root :to => 'home#index'
end
