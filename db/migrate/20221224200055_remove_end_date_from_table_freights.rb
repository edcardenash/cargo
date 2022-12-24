class RemoveEndDateFromTableFreights < ActiveRecord::Migration[7.0]
  def change
    remove_column :table_freights, :end_date, :datetime
  end
end
