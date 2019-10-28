class MaidsController < ApplicationController

    def new
        @maid = Maid.new
    end

    def create
        @maid = Maid.new(maid_params)
        @account = Account.find(session[:account_id])
        @maid.account = @account
        if @maid.save
            
            
    end
    
    private 
    
    def maid_params
        params.require(:maid).permit(:first_name, :last_name, :experience)
    end

end
