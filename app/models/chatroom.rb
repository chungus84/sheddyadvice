class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :post
  belongs_to :user
end
