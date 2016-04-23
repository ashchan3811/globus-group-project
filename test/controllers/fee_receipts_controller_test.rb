require 'test_helper'

class FeeReceiptsControllerTest < ActionController::TestCase
  setup do
    @fee_receipt = fee_receipts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fee_receipts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fee_receipt" do
    assert_difference('FeeReceipt.count') do
      post :create, fee_receipt: { date: @fee_receipt.date, description: @fee_receipt.description, receipt_no: @fee_receipt.receipt_no, semester_id: @fee_receipt.semester_id, student_id: @fee_receipt.student_id }
    end

    assert_redirected_to fee_receipt_path(assigns(:fee_receipt))
  end

  test "should show fee_receipt" do
    get :show, id: @fee_receipt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fee_receipt
    assert_response :success
  end

  test "should update fee_receipt" do
    patch :update, id: @fee_receipt, fee_receipt: { date: @fee_receipt.date, description: @fee_receipt.description, receipt_no: @fee_receipt.receipt_no, semester_id: @fee_receipt.semester_id, student_id: @fee_receipt.student_id }
    assert_redirected_to fee_receipt_path(assigns(:fee_receipt))
  end

  test "should destroy fee_receipt" do
    assert_difference('FeeReceipt.count', -1) do
      delete :destroy, id: @fee_receipt
    end

    assert_redirected_to fee_receipts_path
  end
end
