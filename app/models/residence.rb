class Residence < ApplicationRecord
    belongs_to :client
    has_many :schedules
    has_many :maids, through: :schedules

    validates :address, :city, :state, :number_of_bedrooms, :number_of_bathrooms, presence: true
    validates :number_of_bedrooms, :number_of_bathrooms, numericality: true
    
end
