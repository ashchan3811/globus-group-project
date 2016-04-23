class Batch < ActiveRecord::Base
  has_many :students
  has_one :fee
  validates :year , presence: true , numericality: { only_integer: true }, length: { is: 4 }
end
