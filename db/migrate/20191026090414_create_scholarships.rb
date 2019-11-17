class CreateScholarships < ActiveRecord::Migration[6.0]
  def change
    create_table :scholarships do |t|
      t.string :country
      t.string :subject
      t.integer :education_level
      t.string :institute
      t.integer :number_position
      t.float :amount_scholarship
      t.string :application_link

      t.timestamps
    end
  end
end
