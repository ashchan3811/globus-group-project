class StudentsController < ApplicationController
  before_action :set_student, only: [:update_password,:change_password,:result,:show, :edit, :update, :destroy]
  before_action :set_admin, only: [:index,:new,:create,:destroy]
  before_action :check_login , only: [:result,:show,:edit,:update]
  before_action :check_student_login , only: [:update_password,:change_password]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student,:flash => {:success => 'Student was successfully created.' } }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, :flash => {:success => 'Student was successfully updated.' }}
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to list_students_path, :flash => {:success => 'Student was successfully destroyed.' }}
      format.json { head :no_content }
    end
  end
  
  def change_password
  end
  
  def update_password
    if @student.authenticate(params[:old_password])
      @student.update(password: params[:new_password])
      flash[:success] = "Your password is changed successfully."
      redirect_to student_path(@student)
    else
      flash.now[:danger] = "Your old password do not match"
      render 'change_password'
    end
  end
  
  def result
  end
  
  def import
    if params[:file] == nil
      flash[:danger] = "Please Select the file first."
      redirect_to :back
    else
      Student.import(params[:file])
      redirect_to :back, notice: "Student imported."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :enrollment, :email, :password, :password_confirmation, :college_id, :semester_id, :branch_id, :batch_id, :dateofbirth, :father_name, :mothe_name, :phone, :current_address, :permanent_address)
    end

    
    
    def check_login
      if student_logged_in? || faculty_logged_in? || admin_logged_in?
      else
        redirect_to faculty_login_path
      end
    end
    
    def check_student_login
      if student_logged_in?
      else
        redirect_to student_login_path
      end
    end
end
