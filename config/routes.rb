Rails.application.routes.draw do
  get 'words/index'

  root "words#index"
end
