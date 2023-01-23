class RemoveLongitudeFromVehicleTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :vehicles, :longitude, :float
    remove_column :vehicles, :latitude, :float
  end
end
