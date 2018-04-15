class CheckingProduct < ApplicationRecord
  belongs_to :credit_union
  has_many :checking_accounts, dependent: :destroy
end
