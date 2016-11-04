class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :number, unique: true
      t.text :note
      t.integer :user_id

      t.timestamps
    end
    add_index :orders, :user
  end
end
