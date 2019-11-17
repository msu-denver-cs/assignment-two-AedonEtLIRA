Rails.application.routes.draw do
  resources :car_parts
  resources :car_manufacturers
  resources :cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
