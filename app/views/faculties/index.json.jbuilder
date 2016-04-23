json.array!(@faculties) do |faculty|
  json.extract! faculty, :id, :name, :email, :college_id, :address
  json.url faculty_url(faculty, format: :json)
end
