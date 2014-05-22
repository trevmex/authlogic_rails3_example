class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  helper_method :current_user_session, :current_user

  before_filter :authenticate_user!

  private


    def not_authenticated
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to users_url # TODO: change this to the main page
        return false
      end
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
