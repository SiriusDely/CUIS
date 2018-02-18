require 'test_helper'

class SavingProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin)
    sign_in @user
    @saving_product = saving_products(:one)
  end

  test "should get index" do
    get saving_products_url
    assert_response :success
  end

  test "should get new" do
    get new_saving_product_url
    assert_response :success
  end

  test "should create saving_product" do
    assert_difference('SavingProduct.count') do
      post saving_products_url, params: { saving_product: { credit_union_id: @saving_product.credit_union_id, full_name: @saving_product.full_name, interest_rate: @saving_product.interest_rate, short_name: @saving_product.short_name } }
    end

    assert_redirected_to saving_product_url(SavingProduct.last)
  end

  test "should show saving_product" do
    get saving_product_url(@saving_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_saving_product_url(@saving_product)
    assert_response :success
  end

  test "should update saving_product" do
    patch saving_product_url(@saving_product), params: { saving_product: { credit_union_id: @saving_product.credit_union_id, full_name: @saving_product.full_name, interest_rate: @saving_product.interest_rate, short_name: @saving_product.short_name } }
    assert_redirected_to saving_product_url(@saving_product)
  end

  test "should destroy saving_product" do
    assert_difference('SavingProduct.count', -1) do
      delete saving_product_url(@saving_product)
    end

    assert_redirected_to saving_products_url
  end
end
