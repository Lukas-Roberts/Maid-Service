class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :logged_in?, :current_user, :signup_complete?, :current_account

    def logged_in?
      if session[:account_id]
          true
      else
          false
      end
    end

    def current_account
        @account = Account.find(session[:account_id])
    end

    def signup_complete?
        if current_account.accountable_id
            true
        else
            false
        end
    end

    def current_user
        @id = current_account.accountable_id
        current_account.accountable_type.constantize.find_by(id: @id)
    end

end
