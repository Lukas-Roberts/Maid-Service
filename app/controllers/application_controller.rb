class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :logged_in?

    def logged_in?
      if session[:account_id]
          true
      else
          false
      end
    end

end
