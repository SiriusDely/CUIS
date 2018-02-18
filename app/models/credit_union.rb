class CreditUnion < ApplicationRecord
  validates :full_name, presence: true
  validates :short_name, presence: true, uniqueness: { case_sensitive: false }

  has_many :branches, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :saving_products, dependent: :destroy
end
