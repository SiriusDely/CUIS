# frozen_string_literal: true

json.extract! expense_allocation, :id, :full_name, :short_name, :credit_union_id, :created_at, :updated_at
json.url expense_allocation_url(expense_allocation, format: :json)
