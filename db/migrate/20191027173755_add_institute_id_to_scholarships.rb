class AddInstituteIdToScholarships < ActiveRecord::Migration[6.0]
  def change
    add_column :scholarships, :institute_id, :integer
  end
end
