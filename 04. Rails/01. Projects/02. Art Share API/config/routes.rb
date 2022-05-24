Rails.application.routes.draw do
  resources :users, only: %i[index show create update destroy] do
    resources :artworks, only: %i[index]
  end
  resources :artworks, only: %i[show create update destroy]
  resources :artwork_shares, only: %i[create destroy]
end
