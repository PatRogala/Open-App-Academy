class CommentsController < ApplicationController
  def index
    comments = if params[:user_id]
                 Comment.where(user_id: params[:user_id])
               elsif params[:artwork_id]
                 Comment.where(artwork_id: params[:artwork_id])
               else
                 Comment.all
               end

    render json: comments
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :artwork_id, :user_id)
  end
end
