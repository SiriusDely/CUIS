class CreateShareProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :share_products do |t|
      t.string :full_name,        null: false, default: ""
      t.string :short_name,       null: false, default: ""
      t.decimal :primary_deposit, null: false, default: 0
      t.belongs_to :credit_union, foreign_key: true, null: false

      t.timestamps
    end
  end
end
