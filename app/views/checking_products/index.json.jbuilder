# frozen_string_literal: true

json.array! @checking_products, partial: 'checking_products/checking_product', as: :checking_product
