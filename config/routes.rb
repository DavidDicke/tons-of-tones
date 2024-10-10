Rails.application.routes.draw do
  get 'instruments/index'
  get 'instruments/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :instruments do
    resources :bookings, only: [:new, :create]  # User can book an apartment
  end
  resources :bookings, only: [:index, :show, :destroy, :edit, :update]
end
