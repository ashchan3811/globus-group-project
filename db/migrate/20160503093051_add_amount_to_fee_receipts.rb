class AddAmountToFeeReceipts < ActiveRecord::Migration
  def change
    add_column :fee_receipts, :amount, :integer
  end
end
