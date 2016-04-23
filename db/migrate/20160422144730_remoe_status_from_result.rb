class RemoeStatusFromResult < ActiveRecord::Migration
  def change
    remove_column :results , :status_id
  end
end
