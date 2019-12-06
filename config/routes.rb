# frozen_string_literal: true

Rails.application.routes.draw do
  resources :words
  resources :users
  namespace :words do
    post :check_translation
  end

  post '/login', to: 'authentication#login'
  post '/device_id', to: 'authentication#device_id'
  get '/*a', to: 'application#not_found'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
