class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.integer :fabric_id
      t.integer :fabric_meter_count
      t.text :religion
      t.integer :shipping_date
      t.integer :fabric_price

      t.timestamps
    end
  end
end
