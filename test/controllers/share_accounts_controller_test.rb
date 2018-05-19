# frozen_string_literal: true

require 'test_helper'

class ShareAccountsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin)
    sign_in @user
    @share_account = share_accounts(:one)
  end

  test 'should get index' do
    get share_accounts_url
    assert_response :success
  end

  test 'should get new' do
    get new_share_account_url
    assert_response :success
  end

  test 'should create share_account' do
    assert_difference('ShareAccount.count') do
      post share_accounts_url, params: { share_account: { compulsory_balance: @share_account.compulsory_balance, primary_balance: @share_account.primary_balance, member_id: @share_account.member_id, number: '@share_account.number', share_product_id: @share_account.share_product_id, total_balance: @share_account.total_balance, facultative_balance: @share_account.facultative_balance } }
    end

    assert_redirected_to share_account_url(ShareAccount.last)
  end

  test 'should show share_account' do
    get share_account_url(@share_account)
    assert_response :success
  end

  test 'should get edit' do
    get edit_share_account_url(@share_account)
    assert_response :success
  end

  test 'should update share_account' do
    patch share_account_url(@share_account), params: { share_account: { compulsory_balance: @share_account.compulsory_balance, primary_balance: @share_account.primary_balance, member_id: @share_account.member_id, number: @share_account.number, share_product_id: @share_account.share_product_id, total_balance: @share_account.total_balance, facultative_balance: @share_account.facultative_balance } }
    assert_redirected_to share_account_url(@share_account)
  end

  test 'should destroy share_account' do
    assert_difference('ShareAccount.count', -1) do
      delete share_account_url(@share_account)
    end

    assert_redirected_to share_accounts_url
  end
end
