class CreateSavingProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :saving_products do |t|
      t.string :full_name
      t.string :short_name
      t.float :interest_rate
      t.references :credit_union, foreign_key: true

      t.timestamps
    end
  end
end
