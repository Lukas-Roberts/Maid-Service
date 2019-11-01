class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :logged_in?, :current_user, :signup_complete?, :current_account, :nav_home_path, :nav_edit_path

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
        if signup_complete?
        @id = current_account.accountable_id
        current_account.accountable_type.constantize.find_by(id: @id)
        end
    end

    def nav_home_path
        if signup_complete?
        if current_account.usertype == "maid"
            maid_path(current_user.id)
        else
            client_path(current_user.id)
        end
    end
    end

    def nav_edit_path
        if signup_complete?
        if current_account.usertype == "maid"
            edit_maid_path(current_user.id)
        else
            edit_client_path(current_user.id)
        end
    end
    end

end
