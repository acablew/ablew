class AddTitleToScholarships < ActiveRecord::Migration[6.0]
  def change
    add_column :scholarships, :title, :string
  end
end
