Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :vehicles do
    resources :freights
    resources :reviews
    collection do
      get "my_vehicles"
    end
  end
  resources :freights do
    resources :quotes
  end
  resources :reviews
  resources :quotes
  resources :contacts, only: [:new, :create ]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get 'contacts/sent'
  get '/cities', to: 'cities#index'
  resources :orders, only: [:show, :create]
  resources :orders, only: [:show, :create] do
  resources :payments, only: :new
end
end
