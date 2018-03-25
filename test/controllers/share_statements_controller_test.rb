require 'test_helper'

class ShareStatementsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin)
    sign_in @user
    @share_statement = share_statements(:one)
  end

  test "should get index" do
    get share_statements_url
    assert_response :success
  end

  test "should get new" do
    get new_share_statement_url
    assert_response :success
  end

  test "should create share_statement" do
    assert_difference('ShareStatement.count') do
      post share_statements_url, params: { share_statement: { amount: @share_statement.amount, balance_type_mask: @share_statement.balance_type_mask, is_debit: @share_statement.is_debit, note: @share_statement.note, share_account_id: @share_statement.share_account_id, type_mask: @share_statement.type_mask } }
    end

    assert_redirected_to share_statement_url(ShareStatement.last)
  end

  test "should show share_statement" do
    get share_statement_url(@share_statement)
    assert_response :success
  end

  test "should get edit" do
    get edit_share_statement_url(@share_statement)
    assert_response :success
  end

  test "should update share_statement" do
    patch share_statement_url(@share_statement), params: { share_statement: { amount: @share_statement.amount, balance_type_mask: @share_statement.balance_type_mask, is_debit: @share_statement.is_debit, note: @share_statement.note, share_account_id: @share_statement.share_account_id, type_mask: @share_statement.type_mask } }
    assert_redirected_to share_statement_url(@share_statement)
  end

  test "should destroy share_statement" do
    assert_difference('ShareStatement.count', -1) do
      delete share_statement_url(@share_statement)
    end

    assert_redirected_to share_statements_url
  end
end
