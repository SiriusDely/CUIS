class Member < ApplicationRecord
  belongs_to :credit_union
  belongs_to :branch
  has_many :saving_accounts, dependent: :destroy
end
