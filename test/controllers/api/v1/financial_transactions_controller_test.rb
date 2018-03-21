require 'test_helper'

class Api::V1::FinancialTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_financial_transaction = api_v1_financial_transactions(:one)
  end

  test "should get index" do
    get api_v1_financial_transactions_url, as: :json
    assert_response :success
  end

  test "should create api_v1_financial_transaction" do
    assert_difference('FinancialTransaction.count') do
      post api_v1_financial_transactions_url, params: { api_v1_financial_transaction: { card_number: @api_v1_financial_transaction.card_number, cpf: @api_v1_financial_transaction.cpf, datetime: @api_v1_financial_transaction.datetime, type_id: @api_v1_financial_transaction.type_id, value: @api_v1_financial_transaction.value } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_financial_transaction" do
    get api_v1_financial_transaction_url(@api_v1_financial_transaction), as: :json
    assert_response :success
  end

  test "should update api_v1_financial_transaction" do
    patch api_v1_financial_transaction_url(@api_v1_financial_transaction), params: { api_v1_financial_transaction: { card_number: @api_v1_financial_transaction.card_number, cpf: @api_v1_financial_transaction.cpf, datetime: @api_v1_financial_transaction.datetime, type_id: @api_v1_financial_transaction.type_id, value: @api_v1_financial_transaction.value } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_financial_transaction" do
    assert_difference('FinancialTransaction.count', -1) do
      delete api_v1_financial_transaction_url(@api_v1_financial_transaction), as: :json
    end

    assert_response 204
  end
end
