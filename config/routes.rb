Rails.application.routes.draw do
  
  root "owners#index"
  resources :owners do
    resources :pets
  end
end
