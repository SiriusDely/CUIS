# frozen_string_literal: true

json.extract! share_account, :id, :number, :primary_balance, :compulsory_balance, :facultative_balance, :total_balance, :share_product_id, :member_id, :created_at, :updated_at
json.url share_account_url(share_account, format: :json)
