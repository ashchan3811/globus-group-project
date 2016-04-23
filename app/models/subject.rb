class Subject < ActiveRecord::Base
  
  belongs_to :semester
  belongs_to :branch
  belongs_to :syllabus
  belongs_to :subject_type
  
  has_many :faculties
  
end
