class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new(title: '1245')
  end

  def create
    @post = Post.new(post_param)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def post_param
    params.require(:post).permit(
      :title,
      :text
    )
  end
end
