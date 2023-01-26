class AddColumnToReview < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :vehicle, null: false, foreign_key: true
    add_column :reviews, :comment, :string
  end
end
