class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :logged_in?, :current_user, :signup_complete?, :current_account, :nav_home_path, :nav_edit_path, :authorize
    rescue_from ActiveRecord::RecordNotFound, :with => :rescue404
    rescue_from ActionController::RoutingError, :with => :rescue404


    def logged_in?
      if session[:account_id]
          true
      else
          false
      end
    end

    def authorize(user)
        return head(:forbidden) unless user.id == params[:id].to_i
    end

    def rescue404
        render(:file => File.join(Rails.root, 'public/404.html'), :status => 404, :layout => false)
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

    def authenticate
        redirect_to login_path if !logged_in?
    end

end
