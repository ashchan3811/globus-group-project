class AddBranchIdToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :branch_id, :integer
  end
end
