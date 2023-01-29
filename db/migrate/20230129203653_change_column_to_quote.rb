class ChangeColumnToQuote < ActiveRecord::Migration[7.0]
  def change
    add_monetize :quotes, :amount, currency: { present: false }
  end
end
