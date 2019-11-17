class CreateStatetags < ActiveRecord::Migration[6.0]
  def change
    create_table :statetags do |t|
      t.belongs_to :state, null: false, foreign_key: true
      t.belongs_to :scholarship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
