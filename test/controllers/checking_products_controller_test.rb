require 'test_helper'

class CheckingProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin)
    sign_in @user
    @checking_product = checking_products(:one)
  end

  test "should get index" do
    get checking_products_url
    assert_response :success
  end

  test "should get new" do
    get new_checking_product_url
    assert_response :success
  end

  test "should create checking_product" do
    assert_difference('CheckingProduct.count') do
      post checking_products_url, params: { checking_product: { credit_union_id: @checking_product.credit_union_id, full_name: @checking_product.full_name, interest_rate: @checking_product.interest_rate, short_name: @checking_product.short_name } }
    end

    assert_redirected_to checking_product_url(CheckingProduct.last)
  end

  test "should show checking_product" do
    get checking_product_url(@checking_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_checking_product_url(@checking_product)
    assert_response :success
  end

  test "should update checking_product" do
    patch checking_product_url(@checking_product), params: { checking_product: { credit_union_id: @checking_product.credit_union_id, full_name: @checking_product.full_name, interest_rate: @checking_product.interest_rate, short_name: @checking_product.short_name } }
    assert_redirected_to checking_product_url(@checking_product)
  end

  test "should destroy checking_product" do
    assert_difference('CheckingProduct.count', -1) do
      delete checking_product_url(@checking_product)
    end

    assert_redirected_to checking_products_url
  end
end
