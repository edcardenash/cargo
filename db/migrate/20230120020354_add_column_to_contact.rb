class AddColumnToContact < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :phone, :integer
  end
end
