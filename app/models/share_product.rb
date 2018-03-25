class ShareProduct < ApplicationRecord
  belongs_to :credit_union
  has_many :share_accounts, dependent: :destroy
end
