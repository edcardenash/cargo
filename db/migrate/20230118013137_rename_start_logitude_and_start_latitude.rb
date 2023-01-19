class RenameStartLogitudeAndStartLatitude < ActiveRecord::Migration[7.0]
  def change
    rename_column :freights, :start_latitude, :latitude
    rename_column :freights, :start_longitude, :longitude
  end
end
