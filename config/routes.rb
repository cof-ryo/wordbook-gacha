Rails.application.routes.draw do
  devise_for :users
  root "words#index"
  resources :users, only: [:index, :edit, :update]
  resources :words, only: [:index, :create, :edit, :update, :destroy] do
    member do
      get 'gacha'
      get 'random3'
      get 'random5'
      get 'random10'
    end
  end
end
