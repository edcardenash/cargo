class AddColumnsToVehicles < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :base_region, :string
    add_column :vehicles, :base_city, :string
    add_column :vehicles, :other_regions, :boolean
    add_column :vehicles, :other_cities, :boolean
  end
end
