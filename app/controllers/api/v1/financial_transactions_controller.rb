class Api::V1::FinancialTransactionsController < ApplicationController
  before_action :set_api_v1_financial_transaction, only: [:show, :update, :destroy]

  # GET /api/v1/financial_transactions
  def index
    @api_v1_financial_transactions = FinancialTransaction.all

    render json: @api_v1_financial_transactions
  end

  # GET /api/v1/financial_transactions/1
  def show
    render json: @api_v1_financial_transaction
  end

  # POST /api/v1/financial_transactions
  def create
    @api_v1_financial_transaction = FinancialTransaction.new(api_v1_financial_transaction_params)

    if @api_v1_financial_transaction.save
      render json: @api_v1_financial_transaction, status: :created, location: @api_v1_financial_transaction
    else
      render json: @api_v1_financial_transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/financial_transactions/1
  def update
    if @api_v1_financial_transaction.update(api_v1_financial_transaction_params)
      render json: @api_v1_financial_transaction
    else
      render json: @api_v1_financial_transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/financial_transactions/1
  def destroy
    @api_v1_financial_transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_financial_transaction
      @api_v1_financial_transaction = FinancialTransaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_financial_transaction_params
      params.require(:api_v1_financial_transaction).permit(:type_id, :datetime, :value, :cpf, :card_number)
    end
end
