# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# Assuming you have 12 images in total (airbnb1.webp to airbnb12.webp)
total_images = 12
user = User.create(email:"amir1@gmail.com", password: "123456")
5.times do |i|
  # Create a new property
  property = Property.create(
    name: Faker::Lorem.unique.sentence(word_count: 3),
    headline: Faker::Lorem.paragraph(sentence_count: 6),
    description: Faker::Lorem.sentence(word_count: 6),
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.building_number,
    city: Faker::Address.city,
    state: Faker::Address.state,
    countroy: Faker::Address.country,
    price: Money.from_amount(5000, "PKR")
  )

  # Attach images based on the property index
  if i.even?
    (1..6).each do |j| # Attach images 1 to 6 for even indices
      property.images.attach(io: File.open("app/assets/images/airbnb#{j}.webp"), filename: "airbnb#{j}.webp")
    end
  else
    (7..12).each do |j| # Attach images 7 to 12 for odd indices
      property.images.attach(io: File.open("app/assets/images/airbnb#{j}.webp"), filename: "airbnb#{j}.webp")
    end
  end
  ((5..10).to_a.sample).times do 
  Review.create(
     content: Faker::Lorem.paragraph(sentence_count: 6), 
     cleanliness_rating: (1..5).to_a.sample,
     accuracy_rating: (1..5).to_a.sample,
     checkin_rating: (1..5).to_a.sample,
     communication_rating: (1..5).to_a.sample,
     location_rating: (1..5).to_a.sample,
     value_rating: (1..5).to_a.sample, 
     property:  property,
     user: user
    ) 
end
end
