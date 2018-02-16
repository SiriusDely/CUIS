class CreditUnion < ApplicationRecord
  validates :full_name, presence: true
  validates :short_name, presence: true, uniqueness: { case_sensitive: false }

  has_many :branches, dependent: :destroy
end
