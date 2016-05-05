class FeeReceiptsController < ApplicationController
  before_action :set_admin , only: [:index,:new,:create,:edit,:update,:destroy]
  before_action :set_fee_receipt, only: [:show, :edit, :update, :destroy]

  # GET /fee_receipts
  # GET /fee_receipts.json
  def index
    @fee_receipts = FeeReceipt.all
  end

  # GET /fee_receipts/1
  # GET /fee_receipts/1.json
  def show
  end

  # GET /fee_receipts/new
  def new
    @fee_receipt = FeeReceipt.new
  end

  # GET /fee_receipts/1/edit
  def edit
  end

  # POST /fee_receipts
  # POST /fee_receipts.json
  def create
    @fee_receipt = FeeReceipt.new(fee_receipt_params)

    respond_to do |format|
      if @fee_receipt.save
        format.html { redirect_to @fee_receipt,:flash => {:success => 'Fee receipt was successfully created.' } }
        format.json { render :show, status: :created, location: @fee_receipt }
      else
        format.html { render :new }
        format.json { render json: @fee_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fee_receipts/1
  # PATCH/PUT /fee_receipts/1.json
  def update
    respond_to do |format|
      if @fee_receipt.update(fee_receipt_params)
        format.html { redirect_to @fee_receipt, :flash => {:success => 'Fee receipt was successfully updated.' }  }
        format.json { render :show, status: :ok, location: @fee_receipt }
      else
        format.html { render :edit }
        format.json { render json: @fee_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fee_receipts/1
  # DELETE /fee_receipts/1.json
  def destroy
    @fee_receipt.destroy
    respond_to do |format|
      format.html { redirect_to fee_receipts_url, :flash => {:success => 'Fee receipt was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee_receipt
      @fee_receipt = FeeReceipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fee_receipt_params
      params.require(:fee_receipt).permit(:student_id, :semester_id, :date, :receipt_no, :description , :amount)
    end
end
