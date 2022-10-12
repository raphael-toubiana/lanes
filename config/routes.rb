Rails.application.routes.draw do
  root to: 'trips#index'
  get '/about', to: 'pages#about', as: 'about' 
  resources :trips, only: [:new, :create, :edit, :update, :destroy, :show] do
    resources :reviews, only: [:new, :create]
    collection do
      get :hard
      get :easy
    end
  end
  resources :reviews, only: [:edit, :update, :destroy]
end
