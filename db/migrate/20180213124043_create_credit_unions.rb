class CreateCreditUnions < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_unions do |t|
      t.string :full_name
      t.string :short_name

      t.timestamps
    end
  end
end
