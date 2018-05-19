# frozen_string_literal: true

json.extract! share_statement, :id, :share_account_id, :is_debit, :amount, :balance_type_mask, :type_mask, :note, :created_at, :updated_at
json.url share_statement_url(share_statement, format: :json)
