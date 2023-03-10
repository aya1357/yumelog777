Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'static_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  post '/guest_login', to: 'user_sessions#guest_login'

  get 'studies/log_date', to: 'studies#log_date'
  get 'studies/log_date_api', to: 'studies#log_date_api'
  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :calendars, only: %i[index destroy]
  resources :studies do
    resources :memos
  end
  resource :log, only: %i[new create edit update destroy] do
    get 'logs/log_culc_api', to: 'logs#log_culc_api'
  end
  get 'logs/destroy_all', to: 'logs#destroy_all'
  resources :password_resets, only: %i[new create edit update]

  get '/terms', to: 'static_pages#terms'
  get '/privacy_policy', to: 'static_pages#privacy_policy'
  get '/faq', to: 'static_pages#faq'
  get '/guide', to: 'static_pages#guide'
  get '/start', to: 'static_pages#start'
end
