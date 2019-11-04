class ResidencesController < ApplicationController
    before_action :get_residence, only: [:show, :edit, :update]


    def new
        @residence = Residence.new
    end
    
    def create
        @residence = Residence.new(residence_params)
        @residence.client_id = current_user.id
        if @residence.save
            redirect_to residence_path(@residence)
        else
            render :new
        end
    end

    def show

    end

    def edit
        if @residence.save
            redirect_to client_path
        else 
            render :edit
        end
    end

    def update
        
    end

    private

    def residence_params
        params.require(:residence).permit(:address, :residence_type, :city, :state, :number_of_bedrooms, :number_of_bathrooms)
    end

    def get_residence
        @residence = Residence.find(params[:id])
    end
    
end