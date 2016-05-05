class AdminController < ApplicationController
  
  layout 'admin_layout'
  before_action :check_login, only: [:edit,:update,:students,:faculties,:index,:update_password,:change_password, :destroy]
  before_action :set_admin, only: [:students,:faculties,:edit,:update]
  def index
  end
  
  # GET /admin/faculties
  def faculties
    @faculties = Faculty.all
  end
  
  #GET /admin/students
  def students
    if params[:order_by]
      @students = Student.all.order(params[:order_by])
    else
      @students = Student.all.order(:id)
    end
  end
  
  def edit
  end
  
  def update
    if @admin.update(admin_params)
      flash[:success] = "Your Profile changed Successfully."
      redirect_to admin_path(@admin)
    else
      render :edit
    end
  end
  
  def change_password
  end
  
  def update_password
    if @admin.authenticate(params[:old_password])
      @admin.update(password: params[:new_password])
      flash[:success] = "Your password is changed successfully."
      redirect_to @admin
    else
      flash.now[:danger] = "Your old password do not match"
      render 'change_password'
    end
  end
  
  private 
    def set_admin
      @admin = Admin.find(params[:id])
    end
   def check_login
     if admin_logged_in?
     else
       redirect_to admin_login_path
     end
   end
   
   def admin_params
      params.require(:admin).permit(:name, :email)
    end

end
