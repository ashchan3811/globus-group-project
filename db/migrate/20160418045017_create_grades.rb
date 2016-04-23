class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :grade
      t.integer :points
      t.integer :subject_type_id
      
      t.timestamps null: false
    end
  end
end
