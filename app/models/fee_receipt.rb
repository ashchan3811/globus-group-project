class FeeReceipt < ActiveRecord::Base
  belongs_to :student
  belongs_to :semester
  
  validates :student_id , presence: true
  validates :semester_id , presence: true
  validates :receipt_no , presence: true
  validates :description , presence: true
  validates :amount , presence: true
end
