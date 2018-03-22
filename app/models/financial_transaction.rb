class FinancialTransaction < ApplicationRecord
  validates :card_number, presence: true
  validates :cpf, presence: true, length: { is: 11 }
  validates :datetime, presence: true
  validates :type_id, presence: true, inclusion: { in: [1, 4] }
  validates :value, presence: true, numericality: true
end
