class Client < ApplicationRecord
    has_one :account, as: :accountable
    has_many :residences

    validates :first_name, :last_name, :city, :state, presence: true
    
end
