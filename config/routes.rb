Rails.application.routes.draw do
  root 'static#home'
  devise_for :users, controllers: { registrations: 'registrations' }
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  match 'users/:id' => 'users#make_admin', :via => :get, :as => :make_admin
  resources :users, only: [:index]
end
