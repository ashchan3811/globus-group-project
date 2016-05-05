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
  
  def self.import(file)
   spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      student = find_by_id(row["enrollment"]) || new
      student.attributes = row.to_hash.slice(*row.to_hash.keys)
      student.save!
    end
  end
  
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
  

