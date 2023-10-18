Rails.application.routes.draw do

  root "home#top"
  resources :users, only: %i[new create]
  resource :profile, only: %i[new show edit update]
  resources :curriculum_logs do
    collection do
      get 'search'
    end
  end
  
  get 'chapters/update_chapters', to: 'curriculum_logs#capter_change'

  resources :terms_of_services, only: %i[index]
  resources :privacies, only: %i[index]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
