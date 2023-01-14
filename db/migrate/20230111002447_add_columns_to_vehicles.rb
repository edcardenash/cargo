class AddColumnsToVehicles < ActiveRecord::Migration[7.0]
  def change
    add_reference :vehicles, :city, null: false, foreign_key: true
    add_column :vehicles, :other_regions, :boolean
    add_column :vehicles, :other_cities, :boolean
  end
end
