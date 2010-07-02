class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  helper_method :current_clinician_session, :current_clinician

  private
    def current_clinician_session
      return @current_clinician_session if defined?(@current_clinician_session)
      @current_clinician_session = ClinicianSession.find
    end

    def current_clinician
      return @current_clinician if defined?(@current_clinician)
      @current_clinician = current_clinician_session && current_clinician_session.record
    end

    def require_clinician
      unless current_clinician
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to login_url
        return false
      end
    end

    def require_no_clinician
      if current_clinician
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to clinicians_url # TODO: change this to the main page
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
