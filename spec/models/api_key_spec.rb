require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:description) }
end
