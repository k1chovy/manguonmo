class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  # Validations
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Callbacks
  before_save :normalize_email

  private
  

  # Chuẩn hóa email
  def normalize_email
    self.email_address = email_address.strip.downcase if email_address.present?
  end
end
