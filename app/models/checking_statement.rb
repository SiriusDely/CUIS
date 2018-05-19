# frozen_string_literal: true

class CheckingStatement < ApplicationRecord
  belongs_to :checking_account
  has_one :transfer, as: :transferable, dependent: :destroy

  before_create :set_before_after_balance
  before_create :build_associated_transfer
  after_create :update_account_balance

  STATEMENT_TYPES = %i[ cash_deposit cash_withdrawal bank_deposit bank_withdrawal
                        inter_account_deposit inter_account_withdrawal debit_correction credit_correction
                        administrative_fee interest dividen balance_migration deposit_account_interest
                        checking_transaction loan_transaction].freeze

  def statement_type=(statement_type)
    statement_type = statement_type.to_sym
    self.type_mask =
      STATEMENT_TYPES.include?(statement_type) ? 2**STATEMENT_TYPES.index(statement_type) : 0
  end

  def statement_type
    STATEMENT_TYPES.find do |st|
      ((type_mask.to_i || 0) & 2**STATEMENT_TYPES.index(st)).nonzero?
    end
  end

  private

  def set_before_after_balance
    self.before = checking_account.balance
    self.after = before + (is_debit ? amount : -amount)
  end

  def update_account_balance
    checking_account.update!(balance: after)
  end

  def build_associated_transfer
    transfer = build_transfer(happened_at: DateTime.now)
    cash_account = Account.find_by(code: 100)
    transfer.allotments.build(account: cash_account, is_debit: is_debit, amount: amount, before: cash_account.balance, after: cash_account.balance + (is_debit ? amount : -amount), transfer: transfer)

    daily_interest_checking_account = Account.find_by(code: 400)
    transfer.allotments.build(account: daily_interest_checking_account, is_debit: is_debit, amount: amount, before: daily_interest_checking_account.balance, after: daily_interest_checking_account.balance + (is_debit ? amount : -amount), transfer: transfer)
  end
end
