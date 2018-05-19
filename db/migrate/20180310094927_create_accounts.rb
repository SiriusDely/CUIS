# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :code,        null: false, default: 0
      t.integer :type_mask,   null: false, default: 0
      t.string :full_name,    null: true, default: ''
      t.string :short_name,   null: false, default: ''
      t.decimal :balance,     null: false, default: 0
      t.boolean :is_positive, null: false, default: false

      t.timestamps
    end
    add_index :accounts, :type_mask
    add_index :accounts, :is_positive
  end
end
