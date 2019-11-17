class RemoveCountryFromScholarship < ActiveRecord::Migration[6.0]
  def change
    remove_column :scholarships, :country, :string
  end
end
