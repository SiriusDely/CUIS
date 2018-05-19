# frozen_string_literal: true

class CreditUnion < ApplicationRecord
  validates :full_name, presence: true
  validates :short_name, presence: true, uniqueness: { case_sensitive: false }

  has_many :branches, dependent: :destroy
  has_many :members, dependent: :destroy
  has_one  :share_product, dependent: :destroy
  has_many :checking_products, dependent: :destroy
  has_many :income_sources, dependent: :destroy
  has_many :expense_allocations, dependent: :destroy
end
