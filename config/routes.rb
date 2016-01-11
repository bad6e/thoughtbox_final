Rails.application.routes.draw do
  root "welcome#index"

  get "/join", to: "users#new"
  post "/join", to: "users#create"
end
