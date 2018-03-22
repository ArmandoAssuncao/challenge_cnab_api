module Api
  module V1
    class FinancialTransactionsController < ApplicationController
      before_action :validate_api_key!
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

      def valid_api_key?
        ApiKey.exists?(access_token: request.headers['X-Api-Key'])
      end

      def validate_api_key!
        raise ExceptionHandler::InvalidToken, 'Invalid X-Api-Key' unless valid_api_key?
      end
    end
  end
end
