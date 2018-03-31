class CreateSavingAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :saving_accounts do |t|
      t.string :number,             null: false, default: ""
      t.decimal :balance,           null: false, default: 0.0
      t.float :interest_rate,       null: false, default: 0.0
      t.references :saving_product, foreign_key: true, null: false
      t.belongs_to :member,         foreign_key: true, null: false

      t.timestamps null: false
    end

    add_index :saving_accounts, :number,    unique: true
  end
end
