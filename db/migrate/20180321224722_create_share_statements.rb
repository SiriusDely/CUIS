class CreateShareStatements < ActiveRecord::Migration[5.1]
  def change
    create_table :share_statements do |t|
      t.belongs_to :share_account, foreign_key: true, null: false
      t.boolean :is_debit,                            null: false, default: false
      t.decimal :amount,                              null: false, default: 0.0
      t.decimal :before,                              null: false, default: 0.0
      t.decimal :after,                               null: false, default: 0.0
      t.integer :balance_type_mask,                   null: false, default: 0
      t.integer :type_mask,                           null: false, default: 0
      t.string :note,                                 null: false, default: ""

      t.timestamps
    end
    add_index :share_statements, :is_debit
    add_index :share_statements, :balance_type_mask
    add_index :share_statements, :type_mask
  end
end
