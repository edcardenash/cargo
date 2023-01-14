class RemoveAddressFromVehiclesTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :vehicles, :address, :string
  end
end
