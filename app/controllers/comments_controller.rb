class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end


  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      if @comment.commentable_type == 'user'
        redirect_to user_url(@comment.commentable)
      else
        redirect_to goal_url(@comment.commentable)
      end
      # @comment.comment_type == 'user' ? redirect_to user_url(@comment.commentable) : redirect_to goal_url(@comment.commentable)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end

end
