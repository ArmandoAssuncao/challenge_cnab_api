module Api
  module V1
    class FinancialTransactionsController < ApplicationController
      before_action :validate_params, only: [:index]

      # GET /api/v1/financial_transactions
      def index
        @financial_transactions = if allowed_params.blank?
                                    FinancialTransaction.all
                                  else
                                    FinancialTransaction.where(allowed_params)
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
  end
end
