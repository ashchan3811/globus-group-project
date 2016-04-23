json.array!(@fee_receipts) do |fee_receipt|
  json.extract! fee_receipt, :id, :student_id, :semester_id, :date, :receipt_no, :description
  json.url fee_receipt_url(fee_receipt, format: :json)
end
