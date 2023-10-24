Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'

  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

  root "home#top"
  resources :users, only: %i[new create]
  resource :profile, only: %i[new show edit update]
  resources :curriculum_logs do
    collection do
      get 'search'
    end
  end
  resources :password_resets, only: %i[new create edit update]

  get 'chapters/update_chapters', to: 'curriculum_logs#capter_change'
  get 'curriculums/update_curriculums', to: 'curriculum_logs#curriculum_change'

  resources :terms_of_services, only: %i[index]
  resources :privacies, only: %i[index]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
