class RemoveCountryFromState < ActiveRecord::Migration[6.0]
  def change

    remove_column :scholarships, :state_id, :integer
  end
end
