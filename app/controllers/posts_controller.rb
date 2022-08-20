class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @feedback = Feedback.new
    @post = Post.find(params[:id])
    @feedbacks = Feedback.where(post_id: @post.id)
  end

  def edit
  end

  def update
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    if post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

end
