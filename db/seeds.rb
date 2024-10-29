# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
10.times do
  Property.create(name: Faker::Lorem.unique.sentence(word_count: 3), headline: Faker::Lorem.paragraph(sentence_count: 6), description: Faker::Lorem.sentence(word_count: 6), address_1: Faker::Address.street_address, address_2: Faker::Address.building_number, city: Faker::Address.city, state: Faker::Address.state, countroy: Faker::Address.country, price: Money.from_amount(5000, "PKR") )
  puts "its creating"
end
