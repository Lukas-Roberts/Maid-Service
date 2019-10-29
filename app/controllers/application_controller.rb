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
        @id = Account.find(session[:account_id]).accountable_id
        @account = Account.find(session[:account_id]).accountable_type.constantize.find_by(id: @id)
    end

end
