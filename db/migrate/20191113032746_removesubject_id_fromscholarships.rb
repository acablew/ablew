class RemovesubjectIdFromscholarships < ActiveRecord::Migration[6.0]
  def change
    remove_column :scholarships, :subject_id, :integer
  end
end
