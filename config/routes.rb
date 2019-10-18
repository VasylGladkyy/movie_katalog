Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      patch :toggle
      put :toggle
    end
  end
  root "movies#index"
end