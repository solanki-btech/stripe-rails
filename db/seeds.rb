# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

niceCat = Product.create(title: "Quality Kitty",
  subtitle: "Learn App code", 
  image_name: "kitty.jpg",
  price: "4.99", sku: "kittyOne", download_url: "https://rails-learn-app-bucket.s3.ap-south-1.amazonaws.com/dell-2.jpg",
  details: "A really nice Cat", description: %{<p>Its a cat</p>}
)

niceDoggo = Product.create(title: "Quality Doggo",
  subtitle: "Learn App code", 
  image_name: "doggo.jpg",
  price: "4.99", sku: "kittyOne", download_url: "https://rails-learn-app-bucket.s3.ap-south-1.amazonaws.com/dell-2.jpg",
  details: "A really nice Doggo", description: %{<p>Its a doggo</p>}
)