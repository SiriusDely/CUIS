class CreateBranches < ActiveRecord::Migration[5.1]
  def change
    create_table :branches do |t|
      t.string :full_name
      t.string :short_name
      t.string :address
      t.belongs_to :credit_union, foreign_key: true

      t.timestamps
    end
  end
end
