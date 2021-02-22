Rails.application.routes.draw do

  root 'static_pages#top'
  resources :users do
    member do
      get  'video_chat'
      get 'android_video'
      get  'secret_word'
      patch 'secret_word_update'
    end
  end

  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
