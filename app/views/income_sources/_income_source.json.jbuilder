# frozen_string_literal: true

json.extract! income_source, :id, :full_name, :short_name, :credit_union_id, :created_at, :updated_at
json.url income_source_url(income_source, format: :json)
