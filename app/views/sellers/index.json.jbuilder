#json.array! @sellers, partial: "sellers/seller", as: :seller
json.url signup_seller_url(seller, format: :json)
