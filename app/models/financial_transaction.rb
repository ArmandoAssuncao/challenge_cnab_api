class FinancialTransaction < ApplicationRecord
  include Swagger::Blocks

  swagger_schema :FinancialTransaction do
    key :required, %i[card_number cpf datetime type_id value]
    property :card_number do
      key :type, :string
    end
    property :cpf do
      key :type, :integer
    end
    property :datetime do
      key :type, :string
    end
    property :type_id do
      key :type, :integer
    end
    property :value do
      key :type, :number
    end
  end

  validates :card_number, presence: true
  validates :cpf, presence: true, length: { is: 11 }
  validates :datetime, presence: true
  validates :type_id, presence: true, inclusion: { in: [1, 4] }
  validates :value, presence: true, numericality: true
end
