# frozen_string_literal: true

class CreateAllotments < ActiveRecord::Migration[5.1]
  def change
    create_table :allotments do |t|
      t.decimal :amount,          null: false, default: 0
      t.decimal :before,          null: false, default: 0
      t.decimal :after,           null: false, default: 0
      t.boolean :is_debit,        null: false, default: false
      t.references :account,      foreign_key: true, null: false
      t.references :transfer,     foreign_key: true, null: false

      t.timestamps
    end
  end
end
