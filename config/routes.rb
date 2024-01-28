Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root "static_pages#top"
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'terms_of_service', to: 'static_pages#terms_of_service'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  post 'guest_login', to: 'user_sessions#guest_login'

  resources :users, only: %i[new create]
  resources :stubs do
    collection do
      get 'my_page'
      get 'my_liking'
    end
    resource :likes, only: %i[create destroy]
  end
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
end
