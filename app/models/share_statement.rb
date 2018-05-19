# frozen_string_literal: true

class ShareStatement < ApplicationRecord
  belongs_to :share_account
  has_one :transfer, as: :transferable, dependent: :destroy

  before_create :set_before_after_balance
  before_create :build_associated_transfer
  after_create :update_account_balance

  BALANCE_TYPES = %i[primary compulsory facultative].freeze

  STATEMENT_TYPES = %i[ cash_deposit cash_withdrawal cash_installment_payment cash_loan_dilution
                        bank_deposit bank_withdrawal bank_installment_payment bank_loan_dilution
                        debit_correction credit_correction].freeze

  def balance_type=(balance_type)
    balance_type = balance_type.to_sym
    self.balance_type_mask =
      BALANCE_TYPES.include?(balance_type) ? 2**BALANCE_TYPES.index(balance_type) : 0
  end

  def balance_type
    BALANCE_TYPES.find do |bt|
      ((balance_type_mask.to_i || 0) & 2**BALANCE_TYPES.index(bt)).nonzero?
    end
  end

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
    self.before =
      case balance_type
      when :primary
        share_account.primary_balance
      when :compulsory
        share_account.compulsory_balance
      when :facultative
        share_account.facultative_balance
      end

    self.after = before + (is_debit ? amount : -amount)
  end

  def update_account_balance
    case balance_type
    when :primary
      share_account.update!(primary_balance: after)
    when :compulsory
      share_account.update!(compulsory_balance: after)
    when :facultative
      share_account.update!(facultative_balance: after)
    end
  end

  def build_associated_transfer
    transfer = build_transfer(happened_at: DateTime.now)
    cash_account = Account.find_by(code: 100)
    transfer.allotments.build(account: cash_account, is_debit: is_debit, amount: amount, before: cash_account.balance, after: cash_account.balance + (is_debit ? amount : -amount), transfer: transfer)

    deposit_account =
      case balance_type
      when :primary
        Account.find_by(code: 500)
      when :compulsory
        Account.find_by(code: 501)
      when :facultative
        Account.find_by(code: 401)
      end

    transfer.allotments.build(account: deposit_account, is_debit: is_debit, amount: amount, before: deposit_account.balance, after: deposit_account.balance + (is_debit ? amount : -amount), transfer: transfer)
  end
end
