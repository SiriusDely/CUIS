class ShareAccount < ApplicationRecord
  belongs_to :share_product
  belongs_to :member
  has_many :share_statements, dependent: :destroy
end
