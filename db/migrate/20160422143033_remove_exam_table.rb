class RemoveExamTable < ActiveRecord::Migration
  def change
    drop_table :exams
    add_column :results , :student_id , :integer
    add_column :results , :semester_id , :integer
  end
end
