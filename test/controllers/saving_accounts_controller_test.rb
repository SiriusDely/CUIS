require 'test_helper'

class SavingAccountsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin)
    sign_in @user
    @saving_account = saving_accounts(:one)
  end

  test "should get index" do
    get saving_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_saving_account_url
    assert_response :success
  end

  test "should create saving_account" do
    assert_difference('SavingAccount.count') do
      post saving_accounts_url, params: { saving_account: { interest_rate: @saving_account.interest_rate, member_id: @saving_account.member_id, number: @saving_account.number, saving_product_id: @saving_account.saving_product_id } }
    end

    assert_redirected_to saving_account_url(SavingAccount.last)
  end

  test "should show saving_account" do
    get saving_account_url(@saving_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_saving_account_url(@saving_account)
    assert_response :success
  end

  test "should update saving_account" do
    patch saving_account_url(@saving_account), params: { saving_account: { interest_rate: @saving_account.interest_rate, member_id: @saving_account.member_id, number: @saving_account.number, saving_product_id: @saving_account.saving_product_id } }
    assert_redirected_to saving_account_url(@saving_account)
  end

  test "should destroy saving_account" do
    assert_difference('SavingAccount.count', -1) do
      delete saving_account_url(@saving_account)
    end

    assert_redirected_to saving_accounts_url
  end
end
