class CreateSavingStatements < ActiveRecord::Migration[5.1]
  def change
    create_table :saving_statements do |t|
      t.belongs_to :saving_account, foreign_key: true, null: false
      t.decimal :amount,            null: false, default: 0
      t.boolean :is_debit,          null: false, default: false
      t.string :type_mask,          null: false, default: 0
      t.string :note,               null: true, default: ""

      t.timestamps
    end
    add_index :saving_statements, :type_mask
    add_index :saving_statements, :is_debit
  end
end
