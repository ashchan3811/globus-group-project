class CreateFeeReceipts < ActiveRecord::Migration
  def change
    create_table :fee_receipts do |t|
      t.integer :student_id
      t.integer :semester_id
      t.date :date
      t.integer :receipt_no
      t.string :description

      t.timestamps null: false
    end
  end
end
