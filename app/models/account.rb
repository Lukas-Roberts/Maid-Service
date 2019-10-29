class Account < ApplicationRecord
    belongs_to :accountable, polymorphic: true, optional: true

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    has_secure_password
    
end
