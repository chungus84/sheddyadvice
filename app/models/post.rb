class Post < ApplicationRecord
  belongs_to :user
  has_many :feedbacks, dependent: :destroy
  has_many :listposts, dependent: :destroy
  has_many :lists, through: :listposts, dependent: :destroy
  # has_many :listposts
  validates :title, presence: true
  # validates :title, uniqueness: true
  validates :body, length: { minimum: 20 }
  validates_presence_of :user
  has_one_attached :photo
  has_one_attached :video
  include PgSearch::Model
  pg_search_scope :search_by_title_and_body,
    against: [ :title, :body ],
    using: {
      tsearch: { prefix: true }
    }

end
