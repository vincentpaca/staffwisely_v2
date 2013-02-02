StaffwiselyV2::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :dashboard
  resources :jobs
  resources :projects do
    member do
      get 'send_proposal'
    end
  end
  resources :proposals

  get :how_it_works, :controller => :home, :action => :how_it_works

  devise_for :users, :controllers => { :registrations => "registrations" }
  match 'dashboard' => 'dashboard#index', :as => 'user_root'
  root :to => 'home#index'
end
