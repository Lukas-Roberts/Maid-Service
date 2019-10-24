class Residence < ApplicationRecord
    belongs_to :client
    has_many :schedules
    has_many :maids, through: :schedules
    
end
