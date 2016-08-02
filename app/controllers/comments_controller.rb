class CommentsController < ApplicationController
  def index
    render json: Comment.all
  end

  def create
    @comments = Comment.new(comment_params)
    if @comments.save
      render json: @comments
    else
      render json: @comments.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @comments = Comment.find_by(id: params[:id])
    render json: @comments
  end

  def update
    @comments = Comment.find_by(id: params[:id])
    if @comments.update(comment_params)
      render json: @comments
    else
      render json: @comments.errors.full_messages
    end
  end

  def destroy
    @comments = Comment.find_by(id: params[:id])
    if @comments.destroy
      render json: @comments
    else
      render json: @comments.errors.full_messages
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :external_id)
  end
end
