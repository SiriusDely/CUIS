# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :first_name,       null: false,  default: ''
      t.string :last_name,        null: true,   default: ''
      t.date :birth_date,         null: false
      t.string :birth_place,      null: false, default: ''
      t.belongs_to :credit_union, foreign_key: true, null: false
      t.references :branch,       foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end
