class ResidencesController < ApplicationController

    def new
        @residence = Residence.new
    end
    
    def create
        @residence = Residence.new(residence_params)
        if @residence.save
            redirect_to residence_path(@residence)
        else
            render :new
        end
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