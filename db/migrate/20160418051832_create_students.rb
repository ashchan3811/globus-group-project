class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :enrollment
      t.string :email
      t.string :password_digest
      t.integer :college_id
      t.integer :semester_id , :default => 1
      t.integer :branch_id
      t.integer :batch_id
      t.date :dateofbirth
      t.string :father_name
      t.string :mothe_name
      t.string :phone
      t.text :current_address
      t.text :permanent_address

      t.timestamps null: false
    end
    add_index :students, :email, unique: true
  end
end
