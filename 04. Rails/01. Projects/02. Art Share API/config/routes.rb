Rails.application.routes.draw do
  resources :users, only: %i[index show create update destroy]
  resources :artworks, only: %i[index show create update destroy]
end
