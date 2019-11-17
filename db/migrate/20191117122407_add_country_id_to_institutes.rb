class AddCountryIdToInstitutes < ActiveRecord::Migration[6.0]
  def change
    add_column :institutes, :country_id, :integer
  end
end
