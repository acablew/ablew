class AddSubjectIdToScholarships < ActiveRecord::Migration[6.0]
  def change
    add_column :scholarships, :subject_id, :integer
  end
end
