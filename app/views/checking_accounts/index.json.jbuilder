# frozen_string_literal: true

json.array! @checking_accounts, partial: 'checking_accounts/checking_account', as: :checking_account
