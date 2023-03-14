Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'static_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get 'studies/logs', to: 'logs#show'
  get 'studies/log_date', to: 'studies#log_date'
  get 'studies/log_date_api', to: 'studies#log_date_api'
  get 'log/log_culc_api', to: 'log#log_culc_api'

  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :calendars, only: %i[index destroy]
  resources :studies do
    resources :memos
  end
  resource :log, only: %i[new create edit update destroy] do
    get 'logs/log_culc_api', to: 'logs#log_culc_api'
  end
  resources :password_resets, only: %i[new create edit update]
end
