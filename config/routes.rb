Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show, :create]
  resources :cars
  resources :users do
    resources :reservations, only: [:create, :show, :index, :delete]
  end

  post "users/login", to: "users#login"
end
