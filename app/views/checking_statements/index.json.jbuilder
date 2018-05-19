# frozen_string_literal: true

json.array! @checking_statements, partial: 'checking_statements/checking_statement', as: :checking_statement
