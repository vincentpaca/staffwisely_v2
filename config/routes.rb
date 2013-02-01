StaffwiselyV2::Application.routes.draw do
  devise_for :users

  root :to => 'home#index'

  resources :dashboard
  resources :jobs
  resources :projects
  resources :proposals
end
