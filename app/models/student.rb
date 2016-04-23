class Student < ActiveRecord::Base
  has_secure_password
  
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
    validates :password, presence: true
    validates_confirmation_of :password ,on: :create
    validates :email , presence: true ,uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX }
  
  
end
