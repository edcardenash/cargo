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
  resources :quotes
  get 'vehicles/:id/freights/vehicle_request', to: 'vehicles#vehicle_request', as: 'vehicle_request'
  resources :contacts, only: [:new, :create ]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get 'contacts/sent'
end
