class ResidencesController < ApplicationController
    before_action :get_residence, only: [:show, :edit, :update, :destroy]
    before_action :authenticate

    def new
        @residence = Residence.new
    end
    
    def create
        #@residence = Residence.new(residence_params)
        #@residence.client_id = current_user.id
        @residence = current_user.residences.build(residence_params)
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
        if @residence.update(residence_params)
            redirect_to client_path(current_user.id)
        else 
            render :edit
        end
    end

    def destroy
        @residence.delete
        flash[:alert] = "Residence Deleted"
        redirect_to client_path(current_user.id)
    end

    private

    def residence_params
        params.require(:residence).permit(:address, :residence_type, :city, :state, :number_of_bedrooms, :number_of_bathrooms)
    end

    def get_residence
        @residence = Residence.find(params[:id])
    end
    
end