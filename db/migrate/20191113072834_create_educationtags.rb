class CreateEducationtags < ActiveRecord::Migration[6.0]
  def change
    create_table :educationtags do |t|
      t.belongs_to :education, null: false, foreign_key: true
      t.belongs_to :scholarship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
