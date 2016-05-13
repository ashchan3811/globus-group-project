class Student < ActiveRecord::Base
  has_secure_password
  
  require 'csv'
  require 'roo'
  #Relationships
  
  belongs_to :college
  belongs_to :semester
  belongs_to :branch
  belongs_to :batch
  
  has_many :results
  has_many :fee_receipts
  
  #Validation Rules
  EMAIL_REGEX = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]+\z/i
  
  validates :name, presence: true , length: {in: 5..40}
  validates :enrollment , presence: true , uniqueness: true
  validates :password, presence: true, on: :create
  validates_confirmation_of :password , on: :create
  validates :email , presence: true ,uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX }
  
  #DECIDE NEXT SEMESTER_SGPA_CGPA_NO_OF_BACKLOGS
  def sgpa(semester)
    @results = self.results.where(:semester_id => semester)
    sgpa = 0
    credit = 0
    @results.each do |result|
      if result.subject.subject_type.id == 2
        sgpa = sgpa + result.grade.points * 4
        credit = credit + 4
      else
        sgpa = sgpa + result.grade.points * 2
        credit = credit + 2
      end
    end
    sgpa = sgpa / credit
  end
  
  def self.next_semester(semester)
    next_semester = semester
    
    if semester % 2 == 1
      next_semester = semester + 1
    elsif semester == 4
      backlogs = 0
      for i in 1..4
        backlogs = backlogs + no_of_backs(i)
      end
      if backlogs > 0
        next_semester = 4
      else
        next_semester = 5
      end
    elsif semester == 6
      backlogs = 0
      for i in 5..6
        backlogs = backlogs + no_of_backs(i)
      end
      if backlogs > 5 
        next_semester = 6
      else
        next_semester = 7
      end
    elsif semester == 2
      backlogs = 0
      for i in 1..2
        backlogs = backlogs + no_of_backs(i)
      end
      if backlogs > 5
        next_semester = 2
      else
        next_semester = 3
      end
    elsif semester == 8
      backlogs = 0
      for i in 5..8
        backlogs = backlogs + no_of_backs(i)
      end
      if backlogs > 5
        next_semester = 8
      else
        next_semester = 9
      end
    end
  end
  
  def no_of_backs(semester)
    @results = self.results.where(:semester_id => semester)
    back = 0
    @results.each do |result|
      if result.grade.grade == 'F' || result.grade.grade == 'I' || result.grade.grade == 'W'
        back = back + 1
      end
    end
    back
  end
  
  def cgpa(i)
    cgpa = 0
    for i in 1..i
      if sgpa(i) != 0
        cgpa = cgpa + sgpa(i)
      end
    end
    cgpa = cgpa / i
  end
end
  

