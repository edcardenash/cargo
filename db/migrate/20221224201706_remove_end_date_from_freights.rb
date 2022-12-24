class RemoveEndDateFromFreights < ActiveRecord::Migration[7.0]
  def change
    remove_column :freights, :end_date, :datetime
  end
end
