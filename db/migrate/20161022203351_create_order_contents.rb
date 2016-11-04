class CreateOrderContents < ActiveRecord::Migration[5.0]
  def change
    create_table :order_contents do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :count

      t.timestamps
    end
  end
end
