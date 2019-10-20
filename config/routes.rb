Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      patch :toggle_account_status
      put :toggle_account_status
    end
  end

  resources :movies, only: [:index, :show]
  root "movies#index"
end