class Subject < ApplicationRecord
    validates :name,  presence: true
    has_many :subjecttags, dependent: :delete_all
    has_many :scholarships, through: :subjecttags,dependent: :delete_all
end
