class ListsController < ApplicationController

  def index
    @lists = List.where(user_id: current_user)
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    # @post = Post.where(list_id: @list.id)
    @listpost = Listpost.new
    if params[:query].present?
      @searched_posts = Post.search_by_title_and_body(params[:query])
    else
      @searched_posts = Post.all
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to list_path(@list), success: "Created your list #{@list.name}"
    end


  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
