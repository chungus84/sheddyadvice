class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates_presence_of :rating, :user_id, :post_id

end
