Rails.application.routes.draw do

  root 'static_pages#top'
  resources :users do
    member do
      get  'video_chat'
      get  'secret_word'
      post 'secret_word_create'
    end
  end
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
