class Scholarship < ApplicationRecord
    belongs_to :institute
    # has_many :institute, dependent: :delete_all
    has_many :statetags , dependent: :delete_all
    has_many :subjecttags , dependent: :delete_all
    has_many :educationtags , dependent: :delete_all
    has_many :states, through: :statetags, dependent: :delete_all
    has_many :educations, through: :educationtags, dependent: :delete_all
    has_many :subjects, through: :subjecttags, dependent: :delete_all
    # validates :institute_id, :content,  presence: true
    # def country_name
    #     c = ISO3166::Country[self.country]
    #     return c.translations[I18n.locale.to_s] || c.name
    # end
end
