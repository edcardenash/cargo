Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :vehicles do
    collection do
      get "my_vehicles"
    end
  end
  resources :freights do
    resources :quotes
  end
  resources :reviews
  get 'vehicles/:id/freights/vehicle_request', to: 'vehicles#vehicle_request', as: 'vehicle_request'
end
