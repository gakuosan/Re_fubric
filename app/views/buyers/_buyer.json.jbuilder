json.extract! buyer, :id, :name, :email, :created_at, :updated_at
json.url buyer_url(buyer, format: :json)
