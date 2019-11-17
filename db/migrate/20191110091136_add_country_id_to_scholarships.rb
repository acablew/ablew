class AddCountryIdToScholarships < ActiveRecord::Migration[6.0]
  def change
    add_column :scholarships, :country_id, :integer
  end
end
