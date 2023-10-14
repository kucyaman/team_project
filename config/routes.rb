Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
  get 'curriculm_logs/new'
  get 'curriculm_logs/create'
  get 'curriculm_logs/index'
  get 'curriculm_logs/update'
  get 'curriculm_logs/edit'
  root "home#top"
  resources :users, only: %i[new create]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
