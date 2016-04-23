class HomeController < ApplicationController
  
  def index
  end
  
  def search
  end
  
  def admin_login
    if admin_logged_in?
      flash[:success] = "You are already logged in as Admin with EMAIL ' " + session[:email] + "'"
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
  
end
