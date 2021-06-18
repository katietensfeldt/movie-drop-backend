Rails.application.routes.draw do
  ## Users routes
  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  ## Sessions routes
  post "/sessions" => "sessions#create"

  ## Friendships routes
  get "/friendships" => "friendships#index"
  post "/friendships" => "friendships#create"
  patch "/friendships/:id" => "friendships#update"
  delete "/friendships/:id" => "friendships#destroy"

  ## Suggestions routes
  get "/suggestions" => "suggestions#index"
  post "/suggestions" => "suggestions#create"
  patch "/suggestions/:id" => "suggestions#update"
  delete "/suggestions/:id" => "suggestions#destroy"

  ## Movies routes
  get "/movies" => "movies#index"
  get "/movies/:id" => "movies#show"
end
