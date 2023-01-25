class RemoveColumnFromReview < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :commnent, :string

    change_column :reviews, :comment, :text
  end
end
