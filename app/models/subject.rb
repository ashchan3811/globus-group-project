class Subject < ActiveRecord::Base
  
  belongs_to :semester
  belongs_to :branch
  belongs_to :syllabus
  belongs_to :subject_type
  
  has_many :faculties
  
  #validates :name,  length: {in: 5..50}
  validates :code, presence: true , length: {in: 3..10}
  
  validates :semester_id , presence: true
  validates :branch_id , presence: true
  validates :syllabus_id , presence: true
  validates :subject_type_id , presence: true
end
