class SavingProduct < ApplicationRecord
  belongs_to :credit_union

  has_many :saving_accounts, dependent: :destroy
end
