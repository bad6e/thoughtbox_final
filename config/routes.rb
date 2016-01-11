Rails.application.routes.draw do
  root "welcome#index"

  resources :links

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :links, only: [:update]
    end
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#delete"

  get "/join", to: "users#new"
  post "/join", to: "users#create"
end
