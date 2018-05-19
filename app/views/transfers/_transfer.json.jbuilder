# frozen_string_literal: true

json.extract! transfer, :id, :happened_at, :transferable_id, :transferable_type, :created_at, :updated_at
json.url transfer_url(transfer, format: :json)
