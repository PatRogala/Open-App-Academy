Rails.application.routes.draw do
  root 'cats#index'
  resources :cats, only: %i[index show new create edit update]
end
