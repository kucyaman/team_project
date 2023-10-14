Rails.application.routes.draw do

  root "home#top"
  resources :users, only: %i[new create]
  resources :profiles, only: %i[new show edit update]
  resources :curriculm_logs

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
