Rails.application.routes.draw do

  root 'static#home'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, except: [:new, :create]
  put 'users/:id/elevate' => 'users#elevate', as: :elevate_user

  resources :measures do
    collection do
      get :category
    end
  end

  resources :suggestions, only: [:new, :create]
  get '/terms' => 'static#terms'
end
