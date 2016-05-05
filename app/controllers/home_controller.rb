class HomeController < ApplicationController
  
  def index
    if admin_logged_in?
      @admin
    elsif student_logged_in?
      @student
    elsif faculty_logged_in?
      @faculty
    end
  end
  
  def search
    if params[:enrollment].blank?
     flash[:danger] = "First put Enrollment and then Search"
      redirect_to :back
    else
       @student = Student.find_by(enrollment: params[:enrollment].upcase)
    end
  end
  
  def contact 
  end
  
  def sendMessage
  end
  
  def gallery
  end
  
  #Admin Login Logic
  def admin_login
    if admin_logged_in?
      flash[:success] = "You are already logged in as Admin with  ' " + session[:email] + "'"
      redirect_to admin_path(@admin)
    else
      flash.now[:danger] = "You are not logged in.Please Login."
      render 'admin_login'
    end
  end
  
  def admin_signin
    @admin = Admin.find_by(email: params[:email])
    
    if @admin && @admin.authenticate(params[:password])
      session[:email] = @admin.email
      flash[:success] = "You are logged in as admin with email " + admin.email
      redirect_to admin_path(@admin)
    else
      flash.now[:danger] = "Your email address or password do not match"
      render 'admin_login'
    end
  end
  
  def admin_logout
    session[:email] = nil
    flash[:success] = "You have logged out successfully"
    redirect_to root_path
  end
  
  #Student Login Logic
  def student_login
    if student_logged_in?
      flash[:success] = "You are already logged in as ' " + session[:enrollment] + " '"
      redirect_to student_path(@student)
    else
      flash.now[:danger] = "You are not logged in.Please Login."
      render 'student_login'
    end
  end
  
  def student_signin
    @student = Student.find_by(enrollment: params[:enrollment])
    
    if @student && @student.authenticate(params[:password])
      session[:enrollment] = @student.enrollment
      flash[:success] = "You are logged in as  " + @student.enrollment
      redirect_to student_path(@student)
    else
      flash.now[:danger] = "Your email address or password do not match"
      render 'student_login'
    end
  end
  
  def student_logout
    session[:enrollment] = nil
    flash[:success] = "You have logged out successfully"
    redirect_to root_path
  end
  
  #Faculty Login Logic
  def faculty_login
    if faculty_logged_in?
      flash[:success] = "You are already logged in as ' " + session[:email] + " '"
      redirect_to faculty_path(@faculty)
    else
      flash.now[:danger] = "You are not logged in.Please Login."
      render 'faculty_login'
    end
  end
  
  def faculty_signin
     @faculty = Faculty.find_by(email: params[:email])
    
    if @faculty && @faculty.authenticate(params[:password])
      session[:email] = @faculty.email
      session[:name] = @faculty.name
      flash[:success] = "You are logged in as  " + @faculty.email
      redirect_to faculty_path(@faculty)
    else
      flash.now[:danger] = "Your email address or password do not match"
      render 'faculty_login'
    end
  end
  
  def faculty_logout
    session[:email] = nil
    session[:name] = nil
    flash[:success] = "You have logged out successfully"
    redirect_to root_path
  end

end
