Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'static_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get 'habits/logs', to: 'logs#show'
  get 'habits/log_date', to: 'habits#log_date'

  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :calendars, only: %i[index destroy]
  resources :habits do
    resources :memos
  end
  resources :password_resets, only: %i[new create edit update]
end
