class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @practical = Practical.find(params[:practical_id])
    @comment = @practical.comments.create(comment_params)
    redirect_to @practical
  end
  def destroy
    @comment.destroy
    redirect_to @practical
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def comment_params
      params.require(:comment).permit(:practical_id, :body)
    end
end
