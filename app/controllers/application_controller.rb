class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :logged_in?, :current_user, :signup_complete?

    def logged_in?
      if session[:account_id]
          true
      else
          false
      end
    end

    def signup_complete?
        @account = Account.find(session[:account_id])
        if @account.accountable_id
            true
        else
            false
        end
    end

    def current_user
        @account = Account.find(session[:account_id]).accountable_type.constantize.find_by(account: session[:account_id])
    end

end
