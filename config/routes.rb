Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'trips#index'
  resources :trips, only: [:show, :new, :create, :edit, :update, :destroy]
end
