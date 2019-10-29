class SessionsController < ApplicationController

    def new
    end

    def create
        @account = Account.find_by(username: params[:username])
        if @account && @account.authenticate(params[:password])
            session[:account_id] = @account.id
            if signup_complete?
                if @account.accountable_type == "Maid"
                    redirect_to maid_path(@account)
                else
                    redirect_to client_path(@account)
                end
            else
                if @account.usertype == "maid"
                    redirect_to new_maid_path
                else
                    redirect_to new_client_path
                end
            end
        else
            redirect_to login_path
        end
    end

    def logout
        session.clear
        flash[:notice] = "See you soon!"
        redirect_to root_path
    end
    
end