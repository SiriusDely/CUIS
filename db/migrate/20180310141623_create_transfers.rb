# frozen_string_literal: true

class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.datetime :happened_at,                        null: false
      t.references :transferable, polymorphic: true,  null: true

      t.timestamps
    end
  end
end
