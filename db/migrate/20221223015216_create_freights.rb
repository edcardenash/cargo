class CreateFreights < ActiveRecord::Migration[7.0]
  def change
    create_table :freights do |t|
      t.float :start_latitude
      t.float :start_longitude
      t.float :end_latitude
      t.float :end_logitude
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.text :receiver_name
      t.text :receiver_phone
      t.boolean :round_trip
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
