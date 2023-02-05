class SettingDefaultValueStatusToQuote < ActiveRecord::Migration[7.0]
  def change
    change_column_default :quotes, :status, 0
  end
end
