class MaidsController < ApplicationController
    before_action :get_maid, only: [:show, :edit, :update]
    def new
        @maid = Maid.new
    end

    def create
        @maid = Maid.new(maid_params)
        @account = Account.find(session[:account_id])
        @account.accountable = @maid
        if @account.save
            redirect_to maid_path(@maid)
        else
            redirect_to new_maid_path
        end
    end

    def show 
    end

    def edit
    end

    def update
        @maid.update(maid_params)
        redirect_to maid_path(@maid)
    end
          
    private 
    
    def maid_params
        params.require(:maid).permit(:first_name, :last_name, :city, :state, :experience)
    end

    def get_maid
        @maid = Maid.find(params[:id])
    end

end
