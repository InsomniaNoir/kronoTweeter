Rails.application.routes.draw do
  get 'sessions/create'

  get 'pages/index'
  get 'auth/:provider/callback', to: 'sessions#create'
  root to: "pages#index"
end
