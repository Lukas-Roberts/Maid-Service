class Maid < ApplicationRecord
    has_one :account, as: :accountable
    has_many :schedules
    has_many :residences, through: :schedules

    validates :first_name, :last_name, :city, :state, presence: true

    STATES = CS.states(:us)
    
end
