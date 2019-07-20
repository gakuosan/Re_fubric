class AddImageToFabrics < ActiveRecord::Migration[5.2]
  def change
    add_column :fabrics, :image, :string
  end
end
