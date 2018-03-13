class ShareAccount < ApplicationRecord
  belongs_to :share_product
  belongs_to :member
end
