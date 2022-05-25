Rails.application.routes.draw do
  resources :users, only: %i[index show create update destroy] do
    member do
      resources :artworks, only: %i[index]
    end
  end
  resources :artworks, only: %i[show create update destroy] do
    member do
      post :like, to: 'artworks#like', as: 'like'
      post :unlike, to: 'artworks#unlike', as: 'unlike'
    end
  end
  resources :artwork_shares, only: %i[create destroy]
  resources :comments, only: %i[index create destroy] do
    member do
      post :like, to: 'comments#like', as: 'like'
      post :unlike, to: 'comments#unlike', as: 'unlike'
    end
  end
end
