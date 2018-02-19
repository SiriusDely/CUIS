class CreateBranches < ActiveRecord::Migration[5.1]
  def change
    create_table :branches do |t|
      t.string :full_name,        null: false, default: ""
      t.string :short_name,       null: false, default: ""
      t.string :address,          null: true,  default: ""
      t.belongs_to :credit_union, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
