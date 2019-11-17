class RemoveSubjectFromScholarships < ActiveRecord::Migration[6.0]
  def change

    remove_column :scholarships, :subject, :string
  end
end
