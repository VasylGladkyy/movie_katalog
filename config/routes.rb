require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      patch :toggle_account_status
      put :toggle_account_status
    end
  end

  resources :movies, only: [:index, :show] do
    resources :reviews, only: [:create]
  end
  
  namespace :admin do
    resources :movies
  end
  
  namespace :api do
    resources :movies
  end
  
  root "movies#index"
end