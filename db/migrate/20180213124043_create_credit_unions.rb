class CreateCreditUnions < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_unions do |t|
      t.string :full_name,        null: false
      t.string :short_name,       null: false

      t.timestamps
    end
  end
end
