class ClientsController < ApplicationController

    def new
        @client = Client.new
    end

    def create
        @client = Client.new(client_params)
        @account = Account.find(session[:account_id])
        @account.accountable = @client
        if @account.save
            redirect_to client_path(@client)
        else
            redirect_to new_client_path
        end
    end

    def show
        @client = Client.find(params[:id])
        @residences = Residence.where(["client_id = :client_id", {client_id: params[:id]}])
    end

    private

    def client_params
        params.require(:client).permit(:first_name, :last_name, :city, :state)
    end
    
end