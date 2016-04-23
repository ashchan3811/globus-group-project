json.array!(@subjects) do |subject|
  json.extract! subject, :id, :name, :code, :semester_id, :syllabus_id
  json.url subject_url(subject, format: :json)
end
