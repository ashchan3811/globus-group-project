class Faculty < ActiveRecord::Base
  
  has_secure_password
  
  belongs_to :college
  belongs_to :branch
  
end