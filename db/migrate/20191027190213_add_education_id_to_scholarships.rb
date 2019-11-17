class AddEducationIdToScholarships < ActiveRecord::Migration[6.0]
  def change
    add_column :scholarships, :education_id, :integer
  end
end
