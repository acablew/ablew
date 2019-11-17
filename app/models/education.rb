class Education < ApplicationRecord
    validates :level,  presence: true
    has_many :educationtags
    has_many :scholarships, through: :educationtags
end
