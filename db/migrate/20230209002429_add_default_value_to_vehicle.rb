class AddDefaultValueToVehicle < ActiveRecord::Migration[7.0]
  def change
    change_column_default :vehicles, :covered, false
    change_column_default :vehicles, :other_regions, false
    change_column_default :vehicles, :other_cities, false
  end
end
