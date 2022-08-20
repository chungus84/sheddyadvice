class ListsController < ApplicationController

  def index
    @lists = List.where(user_id: current_user)
  end

  def show
    @list = List.find(params[:id])
    @posts = Post.where(list_id: @list.id)
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

  # def create
  #   @list = List.new

  # end
end
