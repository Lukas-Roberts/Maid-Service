class AccountsController < ApplicationController

    def new
        @account = Account.new
    end

    def create
        @account = Account.new(account_params)
        if @account.save
            session[:account_id] = @account.id
            if params[:accountable_type] == "maid"
                redirect_to new_maid_path
            else
                redirect_to new_client_path
            end
        else
            redirect_to login_path
        end
    end

    private

    def account_params
        params.require(:account).permit(:username, :email, :password, :password_confirmation)
    end

end