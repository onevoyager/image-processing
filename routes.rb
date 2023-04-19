Rails.application.routes.draw do
  require 'sidekiq/web'

  resources :images, only: [:new, :create, :index]
  root 'images#index'
  mount Sidekiq::Web => '/sidekiq'
  get 'images/:id/download', to: 'images#download', as: 'download_image'
end
