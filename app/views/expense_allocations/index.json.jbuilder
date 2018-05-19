# frozen_string_literal: true

json.array! @expense_allocations, partial: 'expense_allocations/expense_allocation', as: :expense_allocation
