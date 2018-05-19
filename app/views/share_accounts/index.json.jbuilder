# frozen_string_literal: true

json.array! @share_accounts, partial: 'share_accounts/share_account', as: :share_account
