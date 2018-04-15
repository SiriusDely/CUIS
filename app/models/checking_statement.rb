class CheckingStatement < ApplicationRecord
  belongs_to :checking_account
  has_one :transfer, as: :transferable, dependent: :destroy

  before_create :set_before_after_balance
  before_create :build_associated_transfer
  after_create :update_account_balance


  STATEMENT_TYPES = %i[ cash_deposit cash_withdrawal bank_deposit bank_withdrawal
    inter_account_deposit inter_account_withdrawal debit_correction credit_correction
    administrative_fee interest dividen balance_migration deposit_account_interest
    checking_transaction loan_transaction
  ]

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
    self.before = self.checking_account.balance
    self.after = self.before + (self.is_debit ? self.amount : -self.amount)
  end

  def update_account_balance
    self.checking_account.update!(balance: self.after)
  end

  def build_associated_transfer
    transfer = build_transfer({ happened_at: DateTime.now })
    cash_account = Account.find_by_code(100)
    transfer.allotments.build({ account: cash_account, is_debit: self.is_debit, amount: self.amount, before: cash_account.balance, after: cash_account.balance + (self.is_debit ? self.amount : -self.amount), transfer: transfer })

    daily_interest_checking_account = Account.find_by_code(400)
    transfer.allotments.build({ account: daily_interest_checking_account, is_debit: self.is_debit, amount: self.amount, before: daily_interest_checking_account.balance, after: daily_interest_checking_account.balance + (self.is_debit ? self.amount : -self.amount), transfer: transfer })
  end

end
