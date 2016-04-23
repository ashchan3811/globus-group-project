class Branch < ActiveRecord::Base
  
  has_many :students
  has_many :subjects
  has_many :faculties
  
  validates_presence_of :name, :description
end
