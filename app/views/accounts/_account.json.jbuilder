# frozen_string_literal: true

json.extract! account, :id, :code, :kind, :full_name, :short_name, :balance, :is_positive, :created_at, :updated_at
json.url account_url(account, format: :json)
