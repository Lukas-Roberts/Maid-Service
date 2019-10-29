class ResidencesController < ApplicationController

    def new

    end
    
    def create

    end

    def show

    end

    def edit

    end

    def update
        
    end

    private

    def residence_params
        params.require(:residence).permit(:address, :residence_type, :city, :state, :number_of_bedrooms, :number_of_bathrooms)
    end
    
end