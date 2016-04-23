class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :code
      t.integer :semester_id
      t.integer :syllabus_id
      t.integer :subject_type_id
      
      t.timestamps null: false
    end
  end
end
