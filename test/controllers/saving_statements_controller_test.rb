require 'test_helper'

class SavingStatementsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin)
    sign_in @user
    @saving_statement = saving_statements(:one)
  end

  test "should get index" do
    get saving_statements_url
    assert_response :success
  end

  test "should get new" do
    get new_saving_statement_url
    assert_response :success
  end

  test "should create saving_statement" do
    assert_difference('SavingStatement.count') do
      post saving_statements_url, params: { saving_statement: { is_debit: @saving_statement.is_debit, note: @saving_statement.note, saving_account_id: @saving_statement.saving_account_id, type_mask: @saving_statement.type_mask } }
    end

    assert_redirected_to saving_statement_url(SavingStatement.last)
  end

  test "should show saving_statement" do
    get saving_statement_url(@saving_statement)
    assert_response :success
  end

  test "should get edit" do
    get edit_saving_statement_url(@saving_statement)
    assert_response :success
  end

  test "should update saving_statement" do
    patch saving_statement_url(@saving_statement), params: { saving_statement: { is_debit: @saving_statement.is_debit, note: @saving_statement.note, saving_account_id: @saving_statement.saving_account_id, type_mask: @saving_statement.type_mask } }
    assert_redirected_to saving_statement_url(@saving_statement)
  end

  test "should destroy saving_statement" do
    assert_difference('SavingStatement.count', -1) do
      delete saving_statement_url(@saving_statement)
    end

    assert_redirected_to saving_statements_url
  end
end
