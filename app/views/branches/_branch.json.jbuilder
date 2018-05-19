# frozen_string_literal: true

json.extract! branch, :id, :full_name, :short_name, :address, :credit_union_id, :created_at, :updated_at
json.url branch_url(branch, format: :json)
