Rails.application.routes.draw do
  devise_for :users
  resources :cars do 
    resources :bookings, only: [:show, :new, :create, :index]
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
