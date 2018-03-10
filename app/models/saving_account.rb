class SavingAccount < ApplicationRecord
  belongs_to :saving_product
  belongs_to :member
  has_many :saving_statements, dependent: :destroy
end
