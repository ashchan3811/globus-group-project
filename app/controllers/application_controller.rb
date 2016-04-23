class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :admin , :admin_logged_in?
   def admin
      @current_user ||= Admin.find_by(email: session[:email]) if session[:email]
   end
  
    def admin_logged_in?
      !!admin
    end
end
