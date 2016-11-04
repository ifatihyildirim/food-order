class ChangeNumberColumnToOrders < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :number,  :string
  end
end
