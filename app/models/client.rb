class Client < ApplicationRecord
    has_one :account, as: :accountable
    has_many :residences
    
end
