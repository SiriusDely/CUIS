class Account < ApplicationRecord
  has_many :allotments, dependent: :destroy
end
