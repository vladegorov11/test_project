class CreateUserCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_companies do |t|
      t.integer :company_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :user_companies, [:company_id, :user_id], unique: true
  end
end
