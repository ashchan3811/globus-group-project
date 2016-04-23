class AddBranchIdToFaculty < ActiveRecord::Migration
  def change
    add_column :faculties, :branch_id, :integer
    add_column :faculties, :subject_id, :integer
  end
end
