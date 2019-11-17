class ChangeAmoutScholarshipToBeInScholarships < ActiveRecord::Migration[6.0]
    def change
        change_column :scholarships, :amount_scholarship, :string
    end
end
