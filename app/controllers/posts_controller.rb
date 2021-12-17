class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(post_param)

    if @post.save
      flash.notice = "Post saved"
      redirect_to posts_path
    else
      flash.alert = "Can't save post"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_param)
      flash.notice = "Post saved"
      redirect_to posts_path
    else
      flash.alert = "Can't save post"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash.notice = "Post destroyed"
      redirect_to posts_path
    else
      flash.alert = "Can't destroy post"
      redirect_to posts_path
    end
  end


  def post_param
    params.require(:post).permit(
      :title,
      :text
    )
  end
end
