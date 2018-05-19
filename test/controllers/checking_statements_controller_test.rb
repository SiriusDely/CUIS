# frozen_string_literal: true

require 'test_helper'

class CheckingStatementsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin)
    sign_in @user
    @checking_statement = checking_statements(:one)
  end

  test 'should get index' do
    get checking_statements_url
    assert_response :success
  end

  test 'should get new' do
    get new_checking_statement_url
    assert_response :success
  end

  test 'should create checking_statement' do
    assert_difference('CheckingStatement.count') do
      post checking_statements_url, params: { checking_statement: { is_debit: @checking_statement.is_debit, note: @checking_statement.note, checking_account_id: @checking_statement.checking_account_id, type_mask: @checking_statement.type_mask } }
    end

    assert_redirected_to checking_statement_url(CheckingStatement.last)
  end

  test 'should show checking_statement' do
    get checking_statement_url(@checking_statement)
    assert_response :success
  end

  test 'should get edit' do
    get edit_checking_statement_url(@checking_statement)
    assert_response :success
  end

  test 'should update checking_statement' do
    patch checking_statement_url(@checking_statement), params: { checking_statement: { is_debit: @checking_statement.is_debit, note: @checking_statement.note, checking_account_id: @checking_statement.checking_account_id, type_mask: @checking_statement.type_mask } }
    assert_redirected_to checking_statement_url(@checking_statement)
  end

  test 'should destroy checking_statement' do
    assert_difference('CheckingStatement.count', -1) do
      delete checking_statement_url(@checking_statement)
    end

    assert_redirected_to checking_statements_url
  end
end
