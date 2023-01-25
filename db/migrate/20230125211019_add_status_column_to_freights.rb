class AddStatusColumnToFreights < ActiveRecord::Migration[7.0]
  def change
    add_column :freights, :status, :string
  end
end
