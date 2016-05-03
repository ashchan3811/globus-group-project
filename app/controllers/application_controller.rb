class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :admin , :admin_logged_in? , :student_logged_in? , :student , :faculty ,:faculty_logged_in?
   
    def admin
      @admin ||= Admin.find_by(email: session[:email]) if session[:email]
    end
  
    def admin_logged_in?
      !!admin
    end
    
    def student
      @student ||= Student.find_by(enrollment: session[:enrollment]) if session[:enrollment]
    end
  
    def student_logged_in?
      !!student
    end
    
    def faculty
      @faculty ||= Faculty.find_by(email: session[:email] , name: session[:name]) if session[:name]
    end
    
    def faculty_logged_in?
      !!faculty
    end
end
