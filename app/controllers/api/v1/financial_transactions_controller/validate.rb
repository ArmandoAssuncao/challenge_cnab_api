module Api
  module V1
    class FinancialTransactionsController
      class Validate
        include ActiveModel::Validations

        attr_accessor :type_id, :datetime, :value, :cpf, :card_number

        validates :card_number, allow_nil: true, length: { minimum: 3 }
        validates :cpf, allow_nil: true, length: { is: 11 }
        validates :datetime, allow_nil: true, format: { with: /[0-9]{4}-[0-9]{2}-[0-9]{2}\z/ }
        validates :type_id, allow_nil: true, numericality: true
        validates :value, allow_nil: true, numericality: true

        def initialize(params = {})
          @card_number = params[:card_number]
          @cpf = params[:cpf]
          @datetime = params[:datetime]
          @type_id = params[:type_id]
          @value = params[:value]
        end
      end
    end
  end
end
