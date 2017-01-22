Rails.application.routes.draw do
  root to: "posts#index"
  
  resources :posts

  get "/comments/new", to: "comments#new"
  post "/comments", to: "comments#create"
  get "comments/:id/edit", to: "comments#edit"
  put "comments/:id", to: "comments#update"
  delete "comments/:id", to: "comments#destroy"

  post "/votes", to: "votes#create"
  put "votes/:id", to: "votes#update"
  delete "votes/:id", to: "votes#destroy"

  get "/users/new", to: "users#new"
  get "/:username", to: "users#show", as: :user
  post "/users", to: "user#create"

  get "/login", to: "sessions#new"
  post "/sessions/new", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
