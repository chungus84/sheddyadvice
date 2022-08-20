class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
