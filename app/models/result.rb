class Result < ActiveRecord::Base
  
  belongs_to :grade
  belongs_to :student
  belongs_to :subject
  
end
