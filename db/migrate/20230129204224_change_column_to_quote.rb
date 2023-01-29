class ChangeColumnToQuote < ActiveRecord::Migration[7.0]
  def change
    add_monetize :quotes, :price, currency: { present: false }
    remove_column :quotes, :amount, :float
  end
end
