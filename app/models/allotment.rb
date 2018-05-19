# frozen_string_literal: true

class Allotment < ApplicationRecord
  belongs_to :account
  belongs_to :transfer

  after_create :update_account_balance

  private

  def update_account_balance
    account.update!(balance: after)
  end
end
