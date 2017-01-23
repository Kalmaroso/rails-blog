Rails.application.routes.draw do
  root to: "posts#index"

  resources :posts

  get "posts/:id/comments/new", to: "comments#new"
  post "/comments", to: "comments#create"
  get "comments/:id/edit", to: "comments#edit"
  patch "comments/:id", to: "comments#update"
  delete "comments/:id", to: "comments#destroy"

  post "/votes", to: "votes#create"
  put "votes/:id", to: "votes#update"
  delete "votes/:id", to: "votes#destroy"

  get "/signup", to: "users#new"
  get "/users/:id", to: "users#show", as: :user
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
