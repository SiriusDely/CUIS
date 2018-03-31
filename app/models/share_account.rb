class ShareAccount < ApplicationRecord
  belongs_to :share_product
  belongs_to :member
  has_many :share_statements, dependent: :destroy

  before_save :update_total_balance

  private
  def update_total_balance
    self.total_balance = self.primary_balance + self.compulsory_balance + self.facultative_balance
  end
end
