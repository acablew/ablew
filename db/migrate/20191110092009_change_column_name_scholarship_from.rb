class ChangeColumnNameScholarshipFrom < ActiveRecord::Migration[6.0]
  def change
    rename_column :scholarships, :country_id, :state_id
  end
end
