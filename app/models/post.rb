class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :feedbacks
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :body, length: { minimum: 20 }
  validates_presence_of :user
end
