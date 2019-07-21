class Stock < ApplicationRecord
belongs_to :seller
belongs_to :fabric

validates :fabric_id, uniqueness: { scope: :seller_id }
end
