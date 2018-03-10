json.extract! saving_statement, :id, :type_mask, :note, :saving_product_id, :is_debit, :created_at, :updated_at
json.url saving_statement_url(saving_statement, format: :json)
