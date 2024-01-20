Rails.application.routes.draw do
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
  #resources :likes, only: %i[create destroy]
end
