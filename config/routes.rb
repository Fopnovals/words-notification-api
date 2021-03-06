# frozen_string_literal: true

Rails.application.routes.draw do
  resources :words
  resources :users
  resources :collections
  namespace :words do
    post :check_translation
  end

  get 'users/:id/collections', to: 'users#find_collections'
  post '/login', to: 'authentication#login'
  post '/device_id', to: 'authentication#device_id'
  get '/*a', to: 'application#not_found'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
