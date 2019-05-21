Rails.application.routes.draw do
  devise_for :users
  resources :cars do 
    resources :bookings, only: [:show, :new, :create, :index]
  end
  root to: 'pages#home'
  get '/users/:id/cars', to: 'cars#mycars', as: 'user_cars'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
