class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.text :address
      t.float :longitude
      t.float :latitude
      t.text :license_plate
      t.text :type
      t.text :description
      t.boolean :covered
      t.float :load_capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
