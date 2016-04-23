json.array!(@students) do |student|
  json.extract! student, :id, :name, :enrollment, :email, :college_id, :semester_id, :branch_id, :batch_id, :dateofbirth, :father_name, :mothe_name, :phone, :current_address, :permanent_address
  json.url student_url(student, format: :json)
end
