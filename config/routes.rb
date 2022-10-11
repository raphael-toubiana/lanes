Rails.application.routes.draw do
  get '/about', to: 'pages#about', as: 'about' 
  root to: 'trips#index'
  resources :trips, only: [:new, :create, :edit, :update, :destroy, :show] do
    resources :reviews, only: [:new, :create]
    collection do
      get :hard
      get :easy
    end
  end
  resources :reviews, only: [:edit, :update, :destroy]
end
