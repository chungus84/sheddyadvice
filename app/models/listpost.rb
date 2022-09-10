class Listpost < ApplicationRecord
  belongs_to :post
  belongs_to :list
  # validates :post, uniqueness: true
  # A list can have many posts but cant have the same post twice.
  # A post can have many lists but cant be on the same list twice.
  validates_uniqueness_of :post_id, :scope => :list_id, :errors => "Post is already in List"
  validates_uniqueness_of :list_id, :scope => :post_id, :errors => "Post is already in List"
end
