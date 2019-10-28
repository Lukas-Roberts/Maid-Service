class SessionsController < ApplicationController

    def new
    end

    def create
        @account = Account.find_by(username: params[:username])
        if @account && @account.authenticate(params[:password])
            session[:account_id] = @account.account_id
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