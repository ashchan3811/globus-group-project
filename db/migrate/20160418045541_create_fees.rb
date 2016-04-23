class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.integer :tution_fee
      t.integer :bus_fee
      t.integer :batch_id

      t.timestamps null: false
    end
  end
end
