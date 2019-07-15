class AddActivationToSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :activation_digest, :string
    add_column :buyers, :activated, :boolean, default: false
    add_column :buyers, :activated_at, :datetime
  end
end
