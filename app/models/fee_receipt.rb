class FeeReceipt < ActiveRecord::Base
  belongs_to :student
  belongs_to :semester
end
