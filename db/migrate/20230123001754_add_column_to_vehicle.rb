class AddColumnToVehicle < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :rating, :float
  end
end
