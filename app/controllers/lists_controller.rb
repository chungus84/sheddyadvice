class ListsController < ApplicationController

  def index
    @lists = List.where(user_id: current_user)
  end
  def show
    @list = List.find(params[:id])
    @posts = Post.where(list_id: @list.id)
  end

  def new
    @list = List.new
  end

  # def create
  #   @list = List.new

  # end
end
