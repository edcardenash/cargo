class AddEndAddressColumnToFreigth < ActiveRecord::Migration[7.0]
  def change
    add_column :freights, :end_address, :string
  end
end
