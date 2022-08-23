class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @listpost = Listpost.new
    @post = Post.find(params[:id])
    @feedback = Feedback.new
    @feedbacks = Feedback.where(post_id: @post.id)
    @searched_lists = List.where(user_id: current_user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    respond_to do |format|
      format.html { redirect_to posts_path }
      format.text { render partial: "posts/post_info", locals: {post: @post}, formats: [:html] }
    end
  end

  def new
    @post = Post.new
  end

  def create
    if user_signed_in?
      @post = Post.new(post_params)
      @post.user = current_user
      if @post.save
        redirect_to post_path(@post)
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path, danger: "login to upload"
    end
  end

  def destroy
  end

private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
