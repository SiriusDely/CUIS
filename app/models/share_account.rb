# frozen_string_literal: true

class ShareAccount < ApplicationRecord
  belongs_to :share_product
  belongs_to :member
  has_many :share_statements, dependent: :destroy

  before_save :update_total_balance

  private

  def update_total_balance
    self.total_balance = primary_balance + compulsory_balance + facultative_balance
  end
end
