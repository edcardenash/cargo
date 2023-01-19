class RenameStarAddresToAddress < ActiveRecord::Migration[7.0]
  def change
    rename_column :freights, :start_address, :address
  end
end
