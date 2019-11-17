class RemoveeducationIdFromScholarship < ActiveRecord::Migration[6.0]
  def change
    remove_column :scholarships, :education_id, :integer
  end
end
