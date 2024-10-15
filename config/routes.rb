Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :users, only: :show

  resources :instruments do
    collection do
      get 'my_instruments', to: 'instruments#my_instruments', as: :my_instruments
    end
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :edit, :update] do
    resources :booking_reviews, only: [:new, :create]

    collection do
      get 'user_bookings', to: 'bookings#user_bookings'
      get 'instrument_bookings', to: 'bookings#instrument_bookings'
    end
  end
end
