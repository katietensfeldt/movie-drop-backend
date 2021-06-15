Rails.application.routes.draw do
  ## Users routes
  post "/users" => "users#create"




  ## Sessions routes
  post "/sessions" => "sessions#create"
end
