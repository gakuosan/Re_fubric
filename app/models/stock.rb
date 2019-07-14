class Stock < ApplicationRecord
belongs_to :seller
belongs_to :fabric

validates :fabric_id, uniqueness: { scope: :buyer_id }
end
