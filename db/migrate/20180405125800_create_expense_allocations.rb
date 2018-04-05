class CreateExpenseAllocations < ActiveRecord::Migration[5.1]
  def change
    create_table :expense_allocations do |t|
      t.string :full_name
      t.string :short_name
      t.belongs_to :credit_union, foreign_key: true

      t.timestamps
    end
  end
end
