Rails.application.routes.draw do

  root 'static#home'

  devise_for :users, controllers: { registrations: 'registrations' }, path_prefix: 'my'
  resources :users, only: [:index, :show, :edit, :update]
  match 'users/:id' => 'users#destroy', via: :delete, as: :admin_destroy_user
  match 'users/set_admin/:id' => 'users#set_admin', via: :put, as: :set_admin

  resources :measures do
    collection do
      match :general,    via: :get
      match :individual, via: :get
      match :relational, via: :get
      match :community,  via: :get
    end
  end

  match '/suggestion' => 'suggestions#suggestion', via: [:get, :post]

  get '/terms' => 'static#terms'
end
