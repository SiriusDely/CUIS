class CreateSavingProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :saving_products do |t|
      t.string :full_name,        null: false, default: ""
      t.string :short_name,       null: false, default: ""
      t.float :interest_rate,     null: false, default: ""
      t.references :credit_union, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
