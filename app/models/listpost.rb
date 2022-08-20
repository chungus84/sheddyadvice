class Listpost < ApplicationRecord
  belongs_to :post
  belongs_to :list, dependent: destroy
end
