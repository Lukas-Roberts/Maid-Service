class Maid < ApplicationRecord
    has_one :account, as: :accountable
    has_many :schedules
    has_many :residences, through: :schedules
    
end
