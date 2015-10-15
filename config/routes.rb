Rails.application.routes.draw do
  get 'sessions/create'
  get 'pages/index'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root to: "pages#index"
end
