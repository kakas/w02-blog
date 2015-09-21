class PostsController < ApplicationController


  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_parmas)

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def post_parmas
      params.require(:post).permit(:title, :body)
    end
end
