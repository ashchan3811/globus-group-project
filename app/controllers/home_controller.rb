class HomeController < ApplicationController
  
  def index
  end
  
  def search
    @student = Student.find_by(enrollment: params[:enrollment].upcase)
  end
  
  #Admin Login Logic
  def admin_login
    if admin_logged_in?
      flash[:success] = "You are already logged in as Admin with  ' " + session[:email] + "'"
      redirect_to admin_path
    else
      flash.now[:danger] = "You are not logged in.Please Login."
      render 'admin_login'
    end
  end
  
  def admin_signin
    admin = Admin.find_by(email: params[:email])
    
    if admin && admin.authenticate(params[:password])
      session[:email] = admin.email
      flash[:success] = "You are logged in as admin with email " + admin.email
      redirect_to admin_path
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
      redirect_to student_path(@current_student)
    else
      flash.now[:danger] = "You are not logged in.Please Login."
      render 'student_login'
    end
  end
  
  def student_signin
    student = Student.find_by(enrollment: params[:enrollment])
    
    if student && student.authenticate(params[:password])
      session[:enrollment] = student.enrollment
      flash[:success] = "You are logged in as  " + student.email
      redirect_to student_path(student)
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
  end
  
  def faculty_signin
    redirect_to faculties_path
  end
  
  def faculty_logout
  end
  
  def forgot_password
  end
end
