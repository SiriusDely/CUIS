class ShareStatement < ApplicationRecord
  belongs_to :share_account
  has_one :transfer, as: :transferable, dependent: :destroy

  before_create :set_before_after_balance
  before_create :build_associated_transfer
  after_create :update_account_balance

  BALANCE_TYPES = %i[ primary compulsory facultative]

  STATEMENT_TYPES = %i[ cash_deposit cash_withdrawal cash_installment_payment cash_loan_dilution
    bank_deposit bank_withdrawal bank_installment_payment bank_loan_dilution
    debit_correction credit_correction
  ]

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
      case self.balance_type
      when :primary
        self.share_account.primary_balance
      when :compulsory
        self.share_account.compulsory_balance
      when :facultative
        self.share_account.facultative_balance
      end

    self.after = self.before + self.amount
  end

  def update_account_balance
    case self.balance_type
    when :primary
      self.share_account.update!(primary_balance: self.after)
    when :compulsory
      self.share_account.update!(compulsory_balance: self.after)
    when :facultative
      self.share_account.update!(facultative_balance: self.after)
    end
  end

  def build_associated_transfer
    transfer = build_transfer({ happened_at: DateTime.now })
    cash_account = Account.find_by_code(100)
    transfer.allotments.build({ account: cash_account, is_debit: self.is_debit, amount: self.amount, before: cash_account.balance, after: cash_account.balance + (self.is_debit ? self.amount : -self.amount), transfer: transfer })

    deposit_account =
      case self.balance_type
      when :primary
        Account.find_by_code(500)
      when :compulsory
        Account.find_by_code(501)
      when :facultative
        Account.find_by_code(401)
      end

    transfer.allotments.build({ account: deposit_account, is_debit: self.is_debit, amount: self.amount, before: deposit_account.balance, after: deposit_account.balance + amount, transfer: transfer })
  end
end
