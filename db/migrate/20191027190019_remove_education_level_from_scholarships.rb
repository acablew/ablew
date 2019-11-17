class RemoveEducationLevelFromScholarships < ActiveRecord::Migration[6.0]
  def change

    remove_column :scholarships, :education_level, :integer
  end
end
