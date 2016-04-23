class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :college_id
      t.text :address

      t.timestamps null: false
    end
  end
end
