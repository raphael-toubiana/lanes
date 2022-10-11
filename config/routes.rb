Rails.application.routes.draw do
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
