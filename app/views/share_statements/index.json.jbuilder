# frozen_string_literal: true

json.array! @share_statements, partial: 'share_statements/share_statement', as: :share_statement
