class FeedbacksController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @feedback = Feedback.new(feedback_params)
    @feedback.post = @post
    @feedback.user = current_user
    if @feedback.save
      redirect_to post_feedback_path, success: "Thanks for feedback"
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @feedback = Feedback.find(params[:feedback_id])
    @feedback.update(feedback_params)
    @feedback.user = current_user
    @feedback.post = @post
    if @feedback.save
      redirect_to post_feedback_path, success: "Successfully updated"
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:rating, :comment, :post_id, :user_id)
  end




end
