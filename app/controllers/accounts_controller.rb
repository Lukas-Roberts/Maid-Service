class AccountsController < ApplicationController

    def new
        @account = Account.new
    end

    def create
        @account = Account.new(account_params)
        if @account.save
            session[:account_id] = @account.id
            if @account.usertype == "maid"
                redirect_to new_maid_path
            else
                redirect_to new_client_path
            end
        else
            render :new
        end
    end

    def choose
        @account = current_account
        @account.usertype == params[:usertype]
        @account.save
        if @account.usertype == "maid"
            redirect_to new_maid_path
        else
            redirect_to new_client_path
        end
    end


    private

    def account_params
        params.require(:account).permit(:username, :email, :password, :password_confirmation, :usertype)
    end

end