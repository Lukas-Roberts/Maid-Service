class SessionsController < ApplicationController

    def new
        @account = Account.new
    end

    def create
        @account = Account.find_by(username: params[:username])
        if @account && @account.authenticate(params[:password])
            session[:account_id] = @account.id
            if signup_complete?
                if @account.accountable_type == "Maid"
                    redirect_to maid_path(@account.accountable_id)
                else
                    redirect_to client_path(@account.accountable_id)
                end
            else
                if @account.usertype == "maid"
                    redirect_to new_maid_path
                else
                    redirect_to new_client_path
                end
            end
        else
            render :new
        end
    end

    def logout
        session.clear
        flash[:notice] = "See you soon!"
        redirect_to root_path
    end

    def googleAuth
        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        @account = Account.from_omniauth(access_token)
        # log_in(@user)
        # Access_token is used to authenticate request made from the rails application to the google server
        @account.google_token = access_token.credentials.token
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        @account.google_refresh_token = refresh_token if refresh_token.present?
        if @account.save
            session[:account_id] = @account.id
            if @account.accountable_type == nil
                render :maid_or_client
            elsif @account.accountable_type == "Maid"
                redirect_to maid_path(@account.accountable_id)
            else 
                redirect_to client_path(@account.accountable_id) 
            end
        else
            flash[:alert] = "Login credentials were incorrect, please try again"
            redirect_to login_path
        end
    end
    
end