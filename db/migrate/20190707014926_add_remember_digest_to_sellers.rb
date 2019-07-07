class AddRememberDigestToSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :remember_digest, :string
  end
end
