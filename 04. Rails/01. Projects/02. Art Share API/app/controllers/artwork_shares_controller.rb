class ArtworkSharesController < ApplicationController
  def create
    artwork_share = ArtworkShare.new(artwork_share_params)
    if artwork_share.save
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork_share = ArtworkShare.find(params[:id])
    artwork_share.destroy
    render json: artwork_share
  end

  def favorite
    artwork = ArtworkShare.find_by(id: params[:id], viever_id: params[:user_id])
    artwork.favorite = true
    artwork.save
    render json: artwork
  end

  def unfavorite
    artwork = ArtworkShare.find_by(id: params[:id], viever_id: params[:user_id])
    artwork.favorite = false
    artwork.save
    render json: artwork
  end

  private

  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end
