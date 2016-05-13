class ResultsController < ApplicationController
  before_action :set_student , only: [:create,:show,:edit,:update,:new,:destroy]
  before_action :set_subject , only: [:create,:show,:edit,:update,:new]
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  
  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    count = 0
    
    params[:subject_id].each do 
      @result = Result.new
      @result.student_id = params[:student_id]
      @result.semester_id = params[:semester_id]
      @result.grade_id = params[:result][:grade_id][count] || 0
      @result.subject_id = params[:subject_id][count]
      if @result.save
      else
        flash[:danger] = "There is some Problem.Please try again."
        render :new
        return
      end
      count = count + 1
    end
    redirect_to student_path(@student)
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.where(:semester_id => params[:semester_id], :student_id=> params[:id])
    end
    
    def set_student
      @student = Student.find(params[:student_id])
    end
    
    def set_subject
      @subjects = @student.branch.subjects.where(:semester_id => params[:semester_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit( :subject_id, :student_id, :grade_id, :semester_id)
    end
end
