class ShareStatement < ApplicationRecord
  belongs_to :share_account

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

end
