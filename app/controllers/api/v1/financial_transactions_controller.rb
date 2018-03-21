class Api::V1::FinancialTransactionsController < ApplicationController
  before_action :validate_params, only: [ :index ]

  # GET /api/v1/financial_transactions
  def index
    if allowed_params.blank?
      @financial_transactions = FinancialTransaction.all
    else
      @financial_transactions = FinancialTransaction.where(allowed_params)
    end
    json_response(@financial_transactions)
  end

  private
    def validate_params
      Validate.new(params).validate!
    end

    def allowed_params
      params.permit(:type_id, :datetime, :value, :cpf, :card_number)
    end
end
