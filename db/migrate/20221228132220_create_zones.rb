class CreateZones < ActiveRecord::Migration[7.0]
  def change
    create_table :zones do |t|
      t.references :city, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
