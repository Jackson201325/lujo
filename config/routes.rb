Rails.application.routes.draw do
  devise_for :users
  resources :cars do 
    resources :bookings, only: [:show, :new, :create, :edit, :update, :index]
  end
  root to: 'pages#home'
  get '/users/:id/cars', to: 'cars#my_cars', as: 'user_cars'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/:id/bookings', to: 'bookings#my_bookings', as: 'user_bookings'
  patch '/accept_booking/:id', to: "bookings#accept", as: :accept_booking
  patch '/reject_booking/:id', to: "bookings#reject", as: :reject_booking
end
