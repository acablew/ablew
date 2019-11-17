class RemoveInstituteFromSchoarships < ActiveRecord::Migration[6.0]
  def change

    remove_column :scholarships, :institute, :string
  end
end
