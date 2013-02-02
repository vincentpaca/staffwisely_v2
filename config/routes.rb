StaffwiselyV2::Application.routes.draw do
  resources :dashboard
  resources :jobs
  resources :projects
  resources :proposals

<<<<<<< HEAD
  get :how_it_works, :controller => :home, :action => :how_it_works
=======
  devise_for :users, :controllers => { :registrations => "registrations" }
  match 'dashboard' => 'dashboard#index', :as => 'user_root'
  root :to => 'home#index'
>>>>>>> 7c6b49a4cd79d934380864aea9fa579377510fba
end
