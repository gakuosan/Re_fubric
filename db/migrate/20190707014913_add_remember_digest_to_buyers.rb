class AddRememberDigestToBuyers < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :remember_digest, :string
  end
end
