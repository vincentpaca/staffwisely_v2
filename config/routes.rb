StaffwiselyV2::Application.routes.draw do
  resources :dashboard
  resources :jobs
  resources :projects
  resources :proposals

  get :how_it_works, :controller => :home, :action => :how_it_works

  devise_for :users, :controllers => { :registrations => "registrations" }
  match 'dashboard' => 'dashboard#index', :as => 'user_root'
  root :to => 'home#index'
end
