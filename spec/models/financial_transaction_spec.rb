require 'rails_helper'

RSpec.describe FinancialTransaction, type: :model do
  # Validate presence
  it { is_expected.to validate_presence_of(:card_number) }
  it { is_expected.to validate_presence_of(:cpf) }
  it { is_expected.to validate_presence_of(:datetime) }
  it { is_expected.to validate_presence_of(:type_id) }
  it { is_expected.to validate_presence_of(:value) }

  it { should allow_values(1, 4).for(:type_id) }
  it { should validate_length_of(:cpf).is_equal_to(11) }
end
