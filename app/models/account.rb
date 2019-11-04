class Account < ApplicationRecord
    belongs_to :accountable, polymorphic: true, optional: true

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, on: :creates
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    has_secure_password

    def self.from_omniauth(auth)
        # Creates a new user only  it doesn't exist
        where(email: auth.info.email).first_or_initialize do |account|
            account.email = auth.info.email
            account.username = auth.info.name + rand(1..1000).to_s
            account.password = Sysrandom.hex(20)
        end
    end
    
end
