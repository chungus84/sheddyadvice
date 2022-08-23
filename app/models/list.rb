class List < ApplicationRecord
  belongs_to :user
  has_many :posts, through: :listposts
  validates_presence_of :name
  has_many :listposts

  include PgSearch::Model
  pg_search_scope :search_by_name, against: [:name], using: { tsearch: { prefix: true } }
end
