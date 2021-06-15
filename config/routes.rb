Rails.application.routes.draw do
  ## Users routes
  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"



  ## Sessions routes
  post "/sessions" => "sessions#create"
end
