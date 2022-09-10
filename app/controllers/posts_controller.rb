class PostsController < ApplicationController

  def index
    if params[:query].present?
      @posts = Post.includes(:user).search_by_title_and_body(params[:query])
    else
      @posts = Post.includes(:user).all
    end

  end

  def show
    @lists = List.all
    @listpost = Listpost.new
    @post = Post.includes(:user).find(params[:id])
    @feedback = Feedback.new
    @feedbacks = Feedback.where(post_id: @post.id)
    @new_chatroom = Chatroom.new
    @chatrooms = Chatroom.where(post_id: params[:id])
    @chatroom = @chatrooms.find { |chatroom| chatroom.user == current_user }
    if params[:query].present?
      @searched_lists = List.where(user_id: current_user).search_by_name(params[:query])
    else
      @searched_lists = List.where(user_id: current_user)
    end
    respond_to do |format|
      format.html
      format.text { render partial: "posts/my_lists", locals: {searched_lists: @searched_lists}, formats: [:html] }
    end

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
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :video)
  end
end
