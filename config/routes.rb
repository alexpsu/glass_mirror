Rails.application.routes.draw do

  root to: "splash#index"
  get "/about", to: "splash#show", as: "about"

  #Routes for CRUD for Users
  get "/users", to: "users#index", as: "users"
  get "/signup", to: "users#new", as: "new_user"
  post "/users", to: "users#create", as: "create_user"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/archive", to: "users#archive", as: "user_archive"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"

  #Routes CRUD jobs
  get "/jobs/:id", to: "jobs#show", as: "job"
  get "/users/:id/jobs", to: "jobs#new", as: "new_job"
  post "/jobs", to:"jobs#create"
  get "/jobs/:id/edit", to: "jobs#edit", as: "edit_job"
  patch "/jobs/:id", to: "jobs#update"
  delete "/jobs/:id", to: "jobs#destroy"

  #Routes CRUD milestones
  get "/jobs/:id/new_milestone", to: "milestones#new", as: "new_milestone"
  post "/milestones", to: "milestones#create"
  get "/jobs/:id/milestones/edit", to: "milestones#edit", as: "edit_milestones"
  patch "/jobs/:id/milestones", to: "milestones#update"
  delete "/milestones/:id", to: "milestones#destroy", as: "delete_milestone"

  #Routes Crud contacts
  get "/contacts/:id", to: "contacts#show", as: "contact"
  get "/jobs/:id/contacts/new", to: "contacts#new", as: "new_contact"
  post "/contacts", to: "contacts#create"
  get "/contacts/:id/edit", to: "contacts#edit", as: "edit_contact"
  patch "/contacts/:id", to: "contacts#update"
  delete "/contacts/:id", to: "contacts#destroy", as: "delete_contact"

  #Routes for login form, logging in and logging out
  get "/login", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "destroy_session"



end
