class AccountsController < ApplicationController

    def new
        @account = Account.new
    end

    def create
        if params[:password] == params[:password_confirmation] && params[:accountable_type]
            @account = Account.create(account_params)
            if @account.accountable_type == "maid"
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
        params.require(:account).permit(:username, :email, :password, :password_confirmation, :accountable_type)
    end

end