class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @post = Post.find(params[:post_id])
  end

  def create
    @chatroom = Chatroom.new
    @post = Post.find(params[:post_id])
    @chatroom.user = current_user
    @chatroom.post = @post
    if @chatroom.save
      redirect_to post_chatroom_path(@post, @chatroom)
    else
      redirect_to post_path(@post)
    end
  end
end
