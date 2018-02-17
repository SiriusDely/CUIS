class Member < ApplicationRecord
  belongs_to :credit_union
  belongs_to :branch
end
