Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :vehicles do
    resources :freights
    collection do
      get "my_vehicles"
    end
  end
  resources :freights do
    resources :quotes
  end
  resources :reviews
  resources :quotes
end
