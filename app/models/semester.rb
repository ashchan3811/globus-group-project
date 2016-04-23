class Semester < ActiveRecord::Base
  has_many :students
  has_many :fee_receipts
end
