class Institute < ApplicationRecord
    belongs_to :state
    has_many :scholarships
    validates :name,  presence: true
    validates :state_id,  presence: true
end
