Rails.application.routes.draw do
  root 'cats#index'
  resources :cats, only: %i[index show new create edit update]
  resources :cat_rental_requests, only: %i[new create]
end
