Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  root "movies#index"
end