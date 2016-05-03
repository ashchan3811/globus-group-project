class FacultiesController < ApplicationController
  before_action :set_faculty, only: [:change_password,:update_password,:students,:index,:show, :edit, :update, :destroy]
  before_action :check_login, only: [:change_password,:update_password,:students,:index,:show, :edit, :update, :destroy]

  
  def index
    
  end
  
  def students
    @students = Student.where(:college_id => @faculty.college_id , :branch_id => @faculty.branch_id)
  end
  # GET /faculties/1
  # GET /faculties/1.json
  def show
  end

  # GET /faculties/new
  def new
    @faculty = Faculty.new
  end

  # GET /faculties/1/edit
  def edit
  end

  # POST /faculties
  # POST /faculties.json
  def create
    @faculty = Faculty.new(faculty_params)

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to @faculty,:flash => {:success => 'Faculty was successfully created.' } }
        format.json { render :show, status: :created, location: @faculty }
      else
        format.html { render :new }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculties/1
  # PATCH/PUT /faculties/1.json
  def update
    respond_to do |format|
      if @faculty.update(faculty_params)
        format.html { redirect_to @faculty,:flash => {:success => 'Faculty was successfully updated.' }}
        format.json { render :show, status: :ok, location: @faculty }
      else
        format.html { render :edit }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculties/1
  # DELETE /faculties/1.json
  def destroy
    @faculty.destroy
    respond_to do |format|
      format.html { redirect_to list_faculty_path,:flash => {:success => 'Faculty was successfully destroyed.' }}
      format.json { head :no_content }
    end
  end
  def change_password
  end
  
  def update_password
    if @faculty.authenticate(params[:old_password])
      @faculty.update(password: params[:new_password])
      flash[:success] = "Your password is changed successfully."
      redirect_to faculty_path(@faculty)
    else
      flash.now[:danger] = "Your old password do not match"
      render 'change_password'
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faculty_params
      params.require(:faculty).permit(:name, :email, :password, :password_confirmation, :college_id, :address ,:branch_id,:subject_id)
    end
    
    def check_login
      if faculty_logged_in?
      else
        redirect_to faculty_login_path
      end
    end

end
