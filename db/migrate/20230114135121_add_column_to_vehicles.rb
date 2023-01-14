class AddColumnToVehicles < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :active, :boolean
  end
end
