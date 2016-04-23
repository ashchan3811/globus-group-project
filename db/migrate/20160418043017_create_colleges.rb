class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :description
      t.text :address

      t.timestamps null: false
    end
  end
end
