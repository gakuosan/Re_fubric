#json.array! @buyers, partial: "buyers/buyer", as: :buyer
json.url signup_buyer_url(buyer, format: :json)
