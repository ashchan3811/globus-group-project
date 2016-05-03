class Result < ActiveRecord::Base
  
  belongs_to :grade
  belongs_to :student
  belongs_to :subject
  belongs_to :semester
  
  #Validation Rules
  
  validates :grade_id , presence: true
  validates :student_id , presence: true
  validates :semester_id , presence: true
  validates :subject_id , presence: true
  
end
