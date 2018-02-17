class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :birth_place
      t.belongs_to :credit_union, foreign_key: true
      t.belongs_to :branch, foreign_key: true, null: true

      t.timestamps
    end
  end
end
