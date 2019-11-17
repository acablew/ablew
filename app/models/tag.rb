class Tag < ApplicationRecord
  belongs_to :post
  belongs_to :keyword
end
