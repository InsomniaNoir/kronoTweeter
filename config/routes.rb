Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  delete '/logout', to: 'sessions#destroy'
  resources :tweets, only: [:new, :create]
  resources :sessions, only: [:create, :destroy]
  resource :pages, only: [:index]
  
  root to: "pages#index"
end
