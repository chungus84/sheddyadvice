class ListpostsController < ApplicationController

  def index
    @listposts = Listpost.where(list_id: params[:list_id])
  end

  # def new
  #   @list = List.find(params[:list_id])
  #   @listpost = Listpost.new
  # end

  def create
    @list = List.find(listpost_params[:list_id])
    # @list = List.find(params[:id])
    @listpost = Listpost.new(listpost_params)
    # @listpost.list = @list
    respond_to do |format|
      if @listpost.save
        format.html { redirect_to list_path(@list) }
        format.json
      else
        format.html { render "lists/show", status: :unprocessable_entity }
        format.json
      end
    end
  end

  def update
  end

  private

  def listpost_params
    params.require(:listpost).permit(:post_id, :list_id)
  end

end
