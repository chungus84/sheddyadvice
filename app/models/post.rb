class Post < ApplicationRecord
  acts_as_votable

  belongs_to :user

  has_many :feedbacks, dependent: :destroy
  has_many :listposts, dependent: :destroy
  has_many :lists, through: :listposts, dependent: :destroy
  # has_many :listposts
  validates :title, presence: true
  # validates :title, uniqueness: true
  validates :body, length: { minimum: 20 }
  validates_presence_of :user
  validates_presence_of :category
  has_one_attached :photo
  has_one_attached :video
  include PgSearch::Model
  pg_search_scope :search_by_title_and_body,
    against: [ :title, :body ],
    using: {
      tsearch: { prefix: true }
    }

  def self.top_rated
    @post = Post.joins(:feedbacks).group("posts.id").order("avg(feedbacks.rating) desc").first(10)
  end

  def self.recent
    @posts = Post.last(8)
  end

  def self.trending
    @posts = Post.offset(rand(Post.count)).first(8)
  end
end
