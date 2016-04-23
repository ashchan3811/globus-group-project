json.array!(@results) do |result|
  json.extract! result, :id, :exam_id, :subject_id, :subject_id, :grade_id, :status_id
  json.url result_url(result, format: :json)
end
