class SavingAccount < ApplicationRecord
  belongs_to :saving_product
  belongs_to :member
end
