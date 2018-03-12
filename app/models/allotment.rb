class Allotment < ApplicationRecord
  belongs_to :account
  belongs_to :transfer
end
