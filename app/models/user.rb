class User < ApplicationRecord
  has_secure_password

  has_one :primary, :class_name => "Contact", :foreign_key => "primary_id"
  has_one :secondary, :class_name => "Contact", :foreign_key => "secondary_id"

  enum role: { primary: 1, secondary: 2 }

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

end
