Rails.application.routes.draw do

  root 'static#home'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, except: [:new, :create]
  put 'users/set_admin/:id' => 'users#set_admin', as: :set_admin

  resources :measures do
    collection do
      get :general
      get :individual
      get :relational
      get :community
    end
  end

  match '/suggestion' => 'suggestions#suggestion', via: [:get, :post]

  get '/terms' => 'static#terms'
end
