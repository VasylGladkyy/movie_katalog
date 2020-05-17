require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'movies#index'

  devise_for :users
  resources :users, only: %i[index show edit update] do
    member do
      put :toggle_account_status
    end
  end

  resources :movies do
    collection do
      get :autocomplete
    end
    member do
      put :add_to_watch_later
    end
    member do
      get :watch_later
    end
    member do
      delete :destroy_watch_later
    end
    resources :reviews
  end

  namespace :admin do
    resources :movies do
      member do
        patch :refresh
      end
    end
  end

  namespace :api do
    resources :movies
  end
end
