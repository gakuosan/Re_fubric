100.times do |n|
  name = Faker::Fabrics::Knit.name
  email = Faker::Internet.email
  password = "password"
  Buyer.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
end
