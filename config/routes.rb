Rails.application.routes.draw do
  # get 'hello_world', to: 'hello_world#index'
  root "recipes#discover"
  devise_for :users
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :recipes, only: [ :index, :show, :create ] do
    get :random, on: :collection
  end
  resources :meals
  resources :baskets, only: [:index, :show]
  resources :profiles
  post 'profiles/preiew', to: 'profiles#preview'

end
