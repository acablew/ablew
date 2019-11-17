class ChangeCountryIdToStateId < ActiveRecord::Migration[6.0]
  def change
    rename_column :institutes, :country_id, :state_id
  end
end
