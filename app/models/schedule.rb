class Schedule < ApplicationRecord
    belongs_to :maid
    belongs_to :residence

    validates :length_of_time, numericality: true
end
