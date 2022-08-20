class ListpostsController < ApplicationController

  def index
    @listposts = Listpost.where(list_id: params[:list_id])
  end

  # def new
  #   @list = List.find(params[:list_id])
  #   @listpost = Listpost.new
  # end

  def create
    @list = List.find(params[:list_id])
    @listpost = Listpost.new(listpost_params)
    @listpost.list = @list
    if @listpost.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  private

  def listpost_params
    params.require(:listpost).permit(:post_id)
  end

end