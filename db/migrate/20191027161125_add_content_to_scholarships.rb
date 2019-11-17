class AddContentToScholarships < ActiveRecord::Migration[6.0]
  def change
    add_column :scholarships, :content, :text
  end
end
