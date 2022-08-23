class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :lists, through: :listposts
  has_many :listposts
  validates :title, presence: true
  # validates :title, uniqueness: true
  validates :body, length: { minimum: 20 }
  validates_presence_of :user

  include PgSearch::Model
  pg_search_scope :search_by_title_and_body,
    against: [ :title, :body ],
    using: {
      tsearch: { prefix: true }
    }

end
