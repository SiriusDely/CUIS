require 'test_helper'

class ShareProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin)
    sign_in @user
    @share_product = share_products(:one)
  end

  test "should get index" do
    get share_products_url
    assert_response :success
  end

  test "should get new" do
    get new_share_product_url
    assert_response :success
  end

  test "should create share_product" do
    assert_difference('ShareProduct.count') do
      post share_products_url, params: { share_product: { credit_union_id: @share_product.credit_union_id, full_name: @share_product.full_name, primary_deposit: @share_product.primary_deposit, short_name: @share_product.short_name } }
    end

    assert_redirected_to share_product_url(ShareProduct.last)
  end

  test "should show share_product" do
    get share_product_url(@share_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_share_product_url(@share_product)
    assert_response :success
  end

  test "should update share_product" do
    patch share_product_url(@share_product), params: { share_product: { credit_union_id: @share_product.credit_union_id, full_name: @share_product.full_name, primary_deposit: @share_product.primary_deposit, short_name: @share_product.short_name } }
    assert_redirected_to share_product_url(@share_product)
  end

  test "should destroy share_product" do
    assert_difference('ShareProduct.count', -1) do
      delete share_product_url(@share_product)
    end

    assert_redirected_to share_products_url
  end
end
