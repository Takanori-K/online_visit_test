Rails.application.routes.draw do

  root 'static_pages#top'
  resources :users do
    member do
      get 'video_chat'
    end
  end
  
  post   '/users/:id/secret_word/:id', to: 'users#secret_word', as: :secret_word
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
