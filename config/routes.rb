Rails.application.routes.draw do
  root to: 'trips#index'
  get '/about', to: 'pages#about', as: 'about'
  resources :trips, except: [:index] do
    resources :reviews, only: [:new, :create]
    resources :trip_locations, only: [:index, :new, :create] do
        resources :locations, only: [:new, :create]
    end

    collection do
      get :hard
      get :easy
    end
  end
  resources :reviews, only: [:edit, :update, :destroy]
  resources :trip_locations, only: [:edit, :update]
end
