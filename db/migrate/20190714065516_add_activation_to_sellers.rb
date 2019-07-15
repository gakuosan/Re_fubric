class AddActivationToSellers < ActiveRecord::Migration[5.2]
  def change
  add_column :sellers, :activation_digest, :string
  add_column :sellers, :activated, :boolean, default: false
  add_column :sellers, :activated_at, :datetime
  end
end
