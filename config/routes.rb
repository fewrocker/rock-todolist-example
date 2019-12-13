Rails.application.routes.draw do
  root to: 'pages#home'

  # Routes with API mode
  namespace :client, defaults: { format: :json } do
    resources :tasks, only: [:index, :create, :update, :destroy]
  end

  # Vue redirect logic
  match "/*path", to: redirect("/?redirect=%{path}"), via: :all
end
