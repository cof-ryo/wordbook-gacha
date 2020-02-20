Rails.application.routes.draw do
  devise_for :users
  root "words#index"
  resources :users, only: [:index, :edit, :update] do
    resources :words, only: [:index, :create, :update, :destroy]
  end
end
