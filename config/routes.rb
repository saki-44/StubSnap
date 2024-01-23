Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  
  get 'password_resets/new'
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  root "static_pages#top"
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :stubs do
    resource :likes, only: %i[create destroy]
    collection do
      get 'my_page'
      get 'my_liking'
    end
  end
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
end
