class College < ActiveRecord::Base
  
  has_many :students
  has_many :faculties
  
  validates_presence_of :name, :description
end
