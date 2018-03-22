class ApiKey < ApplicationRecord
  before_validation :generate_access_token
  before_validation :downcase_email

  validates :access_token, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :description, presence: true

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def generate_access_token
    loop do
      self.access_token = SecureRandom.hex
      break unless self.class.exists?(access_token: access_token)
    end
  end
end
