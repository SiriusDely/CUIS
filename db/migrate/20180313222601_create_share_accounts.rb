class CreateShareAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :share_accounts do |t|
      t.string :number,               null: false, default: ""
      t.decimal :primary_balance,     null: false, default: 0
      t.decimal :compulsory_balance,  null: false, default: 0
      t.decimal :voluntary_balance,   null: false, default: 0
      t.decimal :total_balance,       null: false, default: 0
      t.references :share_product, foreign_key: true, null: false
      t.belongs_to :member, foreign_key: true, null: false

      t.timestamps
    end

    add_index :share_accounts, :number,     unique: true
  end
end
