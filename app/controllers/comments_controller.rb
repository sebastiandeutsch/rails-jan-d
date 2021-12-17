class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    if @comment.save
      flash.notice = "Comment saved"
      redirect_to post_path(@post)
    else
      flash.alert = "Can't save comment"
      redirect_to post_path(@post)
    end
  end

  def comment_params
    params.require(:comment).permit(:text, :name, :email)
  end
end
