module Api
  module V1
    class FinancialTransactionsController < ApplicationController
      include Swagger::Blocks

      swagger_path '/financial_transactions' do
        operation :get do
          key :summary, 'Get transactions'
          key :description, 'Returns financial transactions'
          key :tags, [
            'transaction'
          ]
          parameter do
            key :name, 'X-Api-Key'
            key :in, :header
            key :description, 'Api key to access'
            key :required, true
            key :type, :string
          end
          parameter do
            key :name, :type_id
            key :in, :path
            key :description, 'filter by Type'
            key :type, :integer
          end
          parameter do
            key :name, :datetime
            key :in, :path
            key :description, 'filter by date'
            key :type, :string
            key :format, :date
          end
          parameter do
            key :name, :value
            key :in, :path
            key :description, 'filter by value'
            key :type, :number
            key :format, :int64
          end
          parameter do
            key :name, :cpf
            key :in, :path
            key :description, 'filter by cpf'
            key :type, :integer
          end
          parameter do
            key :name, :card_number
            key :in, :path
            key :description, 'filter by card_number'
            key :type, :integer
          end
          response 200 do
            key :description, 'Response'
            schema type: :array do
              items do
                key :'$ref', :FinancialTransaction
              end
            end
          end
          response 422 do
            key :description, 'Invalid token'
            schema type: :object do
              property :error do
                key :type, :object
                property :message do
                  key :type, :string
                end
              end
            end
          end
          response 400 do
            key :description, 'Unpermitted Parameters'
            schema type: :object do
              property :error do
                key :type, :object
                property :message do
                  key :type, :string
                end
              end
            end
          end
        end
      end

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
