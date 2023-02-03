class AddColumnToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :name, :string
    add_column :payments, :card_number, :integer
    add_column :payments, :expiration_date, :integer
    add_column :payments, :ccv, :integer
  end
end
