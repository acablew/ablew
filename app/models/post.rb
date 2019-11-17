class Post < ApplicationRecord
    belongs_to :category
    validates :title, :content, :category_id, :country,  presence: true
    has_many :tags , dependent: :delete_all
    has_many :keywords, through: :tags, dependent: :delete_all
    def country_name
        c = ISO3166::Country[self.country]
        return c.translations[I18n.locale.to_s] || c.name
    end
end
