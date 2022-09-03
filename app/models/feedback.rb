class Feedback < ApplicationRecord
  scope :top, -> { select('post_id, average(rating) as average').group(:post_id).order('average DESC').limit(3) }
  belongs_to :user
  belongs_to :post
  validates_presence_of :rating, :user_id, :post_id

  def self.average_rating(post)
    feedbacks = post.feedbacks
    feedbacks_sum = feedbacks.to_a.map(&:rating).sum
    feedbacks_count = feedbacks.count
    return feedbacks_sum / feedbacks_count.to_f
  end
end
