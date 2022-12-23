class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.integer :status
      t.float :amount
      t.text :comment
      t.references :vehicle, null: false, foreign_key: true
      t.references :freight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
