class ListsController < ApplicationController

  before_action :set_list, only: %i[ show edit update destroy]
  def index
    @lists = List.where(user_id: current_user)
    @list = List.new
  end

  def show
    # @post = Post.where(list_id: @list.id)
    @listpost = Listpost.new
    if params[:query].present?
      @searched_posts = Post.search_by_title_and_body(params[:query]).limit(5)
    else
      @searched_posts = Post.all.order(:created_at).limit(5)
    end
    respond_to do |format|
      format.html
      format.text { render partial: "lists/posts", locals: {searched_posts: @searched_posts}, formats: [:html] }
    end
  end

  def new
    if user_signed_in?
      @list = List.new
    else
      redirect_to new_user_session_path, danger: "login to create to list"
    end
  end

  def create
    if user_signed_in?
      @list = List.new(list_params)
      @list.user = current_user
      if @list.save
        redirect_to list_path(@list), success: "Created your list #{@list.name}"
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path, danger: "login to create to list"
    end
  end

  def edit
  end

  def update
    @list.update(list_params)
    if @list.user == current_user && @list.save
      redirect_to lists_path, success: "Your list has been updated"
    end
  end

  def destroy
    if @list.user == current_user
      @list.destroy
      redirect_to lists_path, status: :see_other
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end

end
