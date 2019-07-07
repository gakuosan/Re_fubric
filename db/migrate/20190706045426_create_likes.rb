class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :fbric_id
      t.integer :fabric_maker_id

      t.timestamps
    end
  end
end
