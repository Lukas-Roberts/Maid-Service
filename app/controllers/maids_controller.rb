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
            render :new
        end
    end

    def show 
        @schedules = Schedule.where(["maid_id = :maid_id", {maid_id: current_user.id}])
    end

    def edit
    end

    def update
        if @maid.update(maid_params)
            redirect_to maid_path(@maid)
        else
            render :edit
        end
    end
          
    private 
    
    def maid_params
        params.require(:maid).permit(:first_name, :last_name, :city, :state, :experience)
    end

    def get_maid
        @maid = Maid.find(params[:id])
    end

end
