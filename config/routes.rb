# frozen_string_literal: true

Rails.application.routes.draw do
  resources :stories do
    member do
      post 'create_comment'
      get 'like_story'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check # TODO: need to configure during the deployment

  # Defines the root path route ("/")
  root "stories#index"
end
