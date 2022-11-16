# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Restaurant.destroy_all
puts 'Creating 5 fake restaurants...'
5.times do
  restaurant = Restaurant.new(
    name:    Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.phone_number,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
  )
  restaurant.save!
end
puts 'Finished!'

puts 'Creating 100 fake reviews...'
100.times do

  review = Review.new(
    rating: (0..5).to_a.sample,
    content: Faker::Quote.famous_last_words,
    restaurant: Restaurant.all.sample
  )
  review.save!
end
puts 'Finished!'
