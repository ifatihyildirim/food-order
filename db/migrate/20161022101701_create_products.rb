class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :content
      t.float :price

      t.timestamps
    end
  end
end
