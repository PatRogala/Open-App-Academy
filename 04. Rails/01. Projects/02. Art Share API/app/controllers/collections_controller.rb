class CollectionsController < ApplicationController
  def index
    collections = Collection.where(user_id: params[:user_id])
    render json: collections
  end

  def create
    collection = Collection.new(collection_params)
    if collection.save
      render json: collection, status: :created
    else
      render json: collection.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    collection = Collection.find(params[:id])
    render json: collection
  end

  def destroy
    collection = Collection.find(params[:id])
    collection.destroy
    render json: collection
  end

  def add_artwork
    artwork_collection = ArtworkCollection.new(
      artwork_id: params[:artwork_id],
      collection_id: params[:collection_id]
    )
    if artwork_collection.save
      render json: artwork_collection, status: :created
    else
      render json: artwork_collection.errors.full_messages, status: :unprocessable_entity
    end
  end

  def remove_artwork
    collection = ArtworkCollection.find_by(
      artwork_id: params[:artwork_id],
      collection_id: params[:collection_id]
    )
    collection.destroy
    render json: collection
  end

  private

  def collection_params
    params.require(:collection).permit(:user_id, :name)
  end
end
