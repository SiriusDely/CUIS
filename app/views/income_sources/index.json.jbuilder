# frozen_string_literal: true

json.array! @income_sources, partial: 'income_sources/income_source', as: :income_source
