class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :exam_id
      t.integer :subject_id
      t.integer :subject_id
      t.integer :grade_id
      t.integer :status_id

      t.timestamps null: false
    end
  end
end
