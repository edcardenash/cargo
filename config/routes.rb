Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :vehicles do
    resources :zones, only: %i[new create]
  end
  resources :freights do
    resources :quotes
  end
  # resources :zones
  resources :reviews
end
