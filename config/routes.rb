Rails.application.routes.draw do
  resources :users

  get "/login", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "destroy_session"
end
