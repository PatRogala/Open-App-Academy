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
      post :favorite, to: 'artworks#favorite', as: 'favorite'
      post :unfavorite, to: 'artworks#unfavorite', as: 'unfavorite'
    end
  end
  resources :artwork_shares, only: %i[create destroy] do
    member do
      post :favorite, to: 'artwork_shares#favorite', as: 'favorite'
      post :unfavorite, to: 'artwork_shares#unfavorite', as: 'unfavorite'
    end
  end
  resources :comments, only: %i[index create destroy] do
    member do
      post :like, to: 'comments#like', as: 'like'
      post :unlike, to: 'comments#unlike', as: 'unlike'
    end
  end
  resources :collections, only: %i[create show destroy] do
    resources :artworks, only: [:index] do
      post :add, to: 'collections#add_artwork', as: 'add'
      delete :remove, to: 'collections#remove_artwork', as: 'remove'
    end
  end
end
