class AddAddressColumnToFreigth < ActiveRecord::Migration[7.0]
  def change
    add_column :freights, :start_address, :string
  end
end
