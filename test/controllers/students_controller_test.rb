require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { batch_id: @student.batch_id, branch_id: @student.branch_id, college_id: @student.college_id, current_address: @student.current_address, dateofbirth: @student.dateofbirth, email: @student.email, enrollment: @student.enrollment, father_name: @student.father_name, mothe_name: @student.mothe_name, name: @student.name, password: 'secret', password_confirmation: 'secret', permanent_address: @student.permanent_address, phone: @student.phone, semester_id: @student.semester_id }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { batch_id: @student.batch_id, branch_id: @student.branch_id, college_id: @student.college_id, current_address: @student.current_address, dateofbirth: @student.dateofbirth, email: @student.email, enrollment: @student.enrollment, father_name: @student.father_name, mothe_name: @student.mothe_name, name: @student.name, password: 'secret', password_confirmation: 'secret', permanent_address: @student.permanent_address, phone: @student.phone, semester_id: @student.semester_id }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
