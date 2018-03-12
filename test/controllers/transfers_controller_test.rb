require 'test_helper'

class TransfersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin)
    sign_in @user
    @transfer = transfers(:one)
  end

  test "should get index" do
    get transfers_url
    assert_response :success
  end

  test "should get new" do
    get new_transfer_url
    assert_response :success
  end

  test "should create transfer" do
    assert_difference('Transfer.count') do
      post transfers_url, params: { transfer: { happened_at: @transfer.happened_at, transferable_id: @transfer.transferable_id, transferable_type: @transfer.transferable_type } }
    end

    assert_redirected_to transfer_url(Transfer.last)
  end

  test "should show transfer" do
    get transfer_url(@transfer)
    assert_response :success
  end

  test "should get edit" do
    get edit_transfer_url(@transfer)
    assert_response :success
  end

  test "should update transfer" do
    patch transfer_url(@transfer), params: { transfer: { happened_at: @transfer.happened_at, transferable_id: @transfer.transferable_id, transferable_type: @transfer.transferable_type } }
    assert_redirected_to transfer_url(@transfer)
  end

  test "should destroy transfer" do
    assert_difference('Transfer.count', -1) do
      delete transfer_url(@transfer)
    end

    assert_redirected_to transfers_url
  end
end
