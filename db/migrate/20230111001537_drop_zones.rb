class DropZones < ActiveRecord::Migration[7.0]
  def change
    drop_table :zones
  end
end
