Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  root "owners#index"

  # Pets as nested resource within Owners

  resources :owners do
    resources :pets
  end

  resources :pets do
    resources :pet_bookings
  end

end
