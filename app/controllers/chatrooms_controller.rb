class ChatroomsController < ApplicationController

  def index
    # @chatrooms = Chatroom.where(current_user == (:sender || :receiver))
    @chatrooms = Chatroom.where(sender: current_user).or(Chatroom.where(receiver: current_user))
  end

  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    # @chatroom.sender_id = current_user.id
    # raise
    # @chatroom.receiver = @post.user

    # @chatroom.sender_id = current_user
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      redirect_to post_path(:id)
    end
  end

  def chatroom_params
    params.require(:chatroom).permit(:receiver_id, :sender_id)
  end

end
