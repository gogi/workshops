Rails.application.routes.draw do
  resources :users, only: [:show, :index], path: '/profiles'

  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'categories#index'
end
