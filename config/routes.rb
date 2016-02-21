Rails.application.routes.draw do

  get 'milestones/new'

  get 'jobs/show'

  get 'jobs/new'

  root to: 'splash#index'
  get '/about', to: 'splash#show', as: 'about'

  #Routes for CRUD for Users
  get "/users", to: "users#index", as: "users"
  get "/signup", to: "users#new", as: "new_user"
  post "/users", to: "users#create", as: "create_user"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"

  get "/login", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "destroy_session"
end
