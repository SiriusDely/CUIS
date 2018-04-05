require 'test_helper'

class ExpenseAllocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expense_allocation = expense_allocations(:one)
  end

  test "should get index" do
    get expense_allocations_url
    assert_response :success
  end

  test "should get new" do
    get new_expense_allocation_url
    assert_response :success
  end

  test "should create expense_allocation" do
    assert_difference('ExpenseAllocation.count') do
      post expense_allocations_url, params: { expense_allocation: { credit_union_id: @expense_allocation.credit_union_id, full_name: @expense_allocation.full_name, short_name: @expense_allocation.short_name } }
    end

    assert_redirected_to expense_allocation_url(ExpenseAllocation.last)
  end

  test "should show expense_allocation" do
    get expense_allocation_url(@expense_allocation)
    assert_response :success
  end

  test "should get edit" do
    get edit_expense_allocation_url(@expense_allocation)
    assert_response :success
  end

  test "should update expense_allocation" do
    patch expense_allocation_url(@expense_allocation), params: { expense_allocation: { credit_union_id: @expense_allocation.credit_union_id, full_name: @expense_allocation.full_name, short_name: @expense_allocation.short_name } }
    assert_redirected_to expense_allocation_url(@expense_allocation)
  end

  test "should destroy expense_allocation" do
    assert_difference('ExpenseAllocation.count', -1) do
      delete expense_allocation_url(@expense_allocation)
    end

    assert_redirected_to expense_allocations_url
  end
end
