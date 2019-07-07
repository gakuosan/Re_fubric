class CreateFabrics < ActiveRecord::Migration[5.2]
  def change
    create_table :fabrics do |t|
      t.string :fabric_color
      t.integer :fabric_weight
      t.integer :fabric_yarn_count
      t.string :fabric_knitting_way
      t.integer :fabric_price
      t.integer :fabric_composition
      t.integer :fabric_id
      t.integer :fabric_count

      t.timestamps
    end
  end
end
