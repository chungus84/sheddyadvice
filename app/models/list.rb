class List < ApplicationRecord
  belongs_to :user
  has_many :listposts, dependent: :destroy
  has_many :posts, through: :listposts, dependent: :destroy

  validates_presence_of :name

  include PgSearch::Model
  pg_search_scope :search_by_name, against: [:name], using: { tsearch: { prefix: true } }

end
