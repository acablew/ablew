class State < ApplicationRecord
    validates :name,  presence: true
    has_many :statetags, dependent: :delete_all
    has_many :scholarships, through: :statetags, dependent: :delete_all
    has_many :institutes, dependent: :delete_all
end
