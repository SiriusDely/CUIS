class CreateSavingAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :saving_accounts do |t|
      t.string :number
      t.float :interest_rate
      t.references :saving_product, foreign_key: true
      t.belongs_to :member, foreign_key: true

      t.timestamps
    end
  end
end
