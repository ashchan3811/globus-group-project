class AdminController < ApplicationController
  
  layout 'admin_layout'
  
  def index
  end
  
  # GET /admin/faculties
  def faculties
    @faculties = Faculty.all
  end
  
  #GET /admin/students
  def students
    @students = Student.all
  end

end
