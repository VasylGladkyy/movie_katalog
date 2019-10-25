require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'movies#index'

  devise_for :users
  resources :users, only: %i[index show edit update] do
    member do
      patch :toggle_account_status
      put :toggle_account_status
    end
  end

  resources :movies, only: %i[index show] do
    member do
      patch :add_to_watch_later
      put :add_to_watch_later
    end
    member do
      get :watch_later
    end
    member do
      delete :destroy_watch_later
    end
    resources :reviews, only: [:create]
  end

  namespace :admin do
    resources :movies
  end

  namespace :api do
    resources :movies
  end
end
