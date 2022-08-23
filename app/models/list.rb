class List < ApplicationRecord
  belongs_to :user
  has_many :posts, through: :listposts
  validates_presence_of :name
  has_many :listposts
end
