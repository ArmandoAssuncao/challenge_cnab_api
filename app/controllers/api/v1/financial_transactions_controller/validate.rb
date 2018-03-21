class Api::V1::FinancialTransactionsController::Validate
  include ActiveModel::Validations

  attr_accessor :type_id, :datetime, :value, :cpf, :card_number

  validates :card_number, allow_nil: true, numericality: true
  validates :cpf, allow_nil: true, length: { is: 11 }
  validates :datetime, allow_nil: true, format: { with: /[0-9]{4}-[0-9]{2}-[0-9]{2}\z/ }
  validates :type_id, allow_nil: true, numericality: true, inclusion: { in: ['1', '2', '3'] }
  validates :value, allow_nil: true, numericality: true

  def initialize(params={})
    @card_number = params[:card_number]
    @cpf = params[:cpf]
    @datetime = params[:datetime]
    @type_id = params[:type_id]
    @value = params[:value]
  end
end
