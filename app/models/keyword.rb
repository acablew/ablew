class Keyword < ApplicationRecord
    validates :label, presence: true
    has_many :tags, dependent: :delete_all
    has_many :posts, through: :tags, dependent: :delete_all
end
