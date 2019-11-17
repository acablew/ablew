class AddDeadlineToScholarships < ActiveRecord::Migration[6.0]
  def change
    add_column :scholarships, :deadline, :string
  end
end
