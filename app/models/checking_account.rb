# frozen_string_literal: true

class CheckingAccount < ApplicationRecord
  belongs_to :checking_product
  belongs_to :member
  has_many :checking_statements, dependent: :destroy
end
