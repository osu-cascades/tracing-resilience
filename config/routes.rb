Rails.application.routes.draw do
  root 'static#home'
  devise_for :users, controllers: { registrations: 'registrations' }
  match 'users/:id' => 'users#destroy', via: :delete, as: :admin_destroy_user
  match 'users/:id' => 'users#make_admin', via: :get, as: :make_admin
  resources :users, only: [:index]
  resources :measures do
    collection do
      match :general,    via: :get
      match :individual, via: :get
      match :relational, via: :get
      match :community,  via: :get
    end
  end
end
