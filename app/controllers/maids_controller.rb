class MaidsController < ApplicationController

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
          
    private 
    
    def maid_params
        params.require(:maid).permit(:first_name, :last_name, :experience)
    end

end
