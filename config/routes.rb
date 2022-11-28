Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show, :create]
  resources :cars, only: [:index, :show]
  resources :users do
    resources :reservations, only: [:create, :show, :delete]
  end

  post "users/login", to: "users#login"
end
