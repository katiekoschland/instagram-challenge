class PostsController < ApplicationController

  def index
    @posts= Post.all
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to '/posts'
    else
      flash[:alert] = 'You need an image to post'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(:image, :description, :tag_names)
  end

end
