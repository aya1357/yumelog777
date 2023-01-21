Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'static_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :calendars, only: %i[index destroy]
  resources :habits, only: %i[new create show edit update destroy]
  resources :password_resets, only: %i[new create edit update]
end
