require 'test_helper'

class CreditUnionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin)
    sign_in @user
    @credit_union = credit_unions(:one)
  end

  test "should get index" do
    get credit_unions_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_union_url
    assert_response :success
  end

  test "should create credit_union" do
    assert_difference('CreditUnion.count') do
      post credit_unions_url, params: { credit_union: { full_name: @credit_union.full_name, short_name: "unique_name" } }
    end

    assert_redirected_to credit_union_url(CreditUnion.last)
  end

  test "should show credit_union" do
    get credit_union_url(@credit_union)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_union_url(@credit_union)
    assert_response :success
  end

  test "should update credit_union" do
    patch credit_union_url(@credit_union), params: { credit_union: { full_name: @credit_union.full_name, short_name: @credit_union.short_name } }
    assert_redirected_to credit_union_url(@credit_union)
  end

  test "should destroy credit_union" do
    assert_difference('CreditUnion.count', -1) do
      delete credit_union_url(@credit_union)
    end

    assert_redirected_to credit_unions_url
  end
end
