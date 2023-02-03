class AddCitiesToFreight < ActiveRecord::Migration[7.0]
  def change
    add_column :freights, :start_city, :string
    add_column :freights, :end_city, :string
  end
end
