class List < ApplicationRecord
  belongs_to :user
  has_many :posts, through: :list_posts
  validates_presence_of :name
end
