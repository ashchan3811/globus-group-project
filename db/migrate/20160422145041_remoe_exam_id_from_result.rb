class RemoeExamIdFromResult < ActiveRecord::Migration
  def change
    remove_column :results , :exam_id
  end
end
