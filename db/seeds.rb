# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"


prices = [600, 700, 800, 900, 1000]
true_false = [(1 + 2 == 3), (1 + 2 == 4)]
image_link_sources = ["01.jpg", "02.jpg", "03.jpg", "04.jpg", "05.jpg"]

puts "Destroying old beers..."

Beer.destroy_all

puts "...Old beers destroyed."

puts "Making beers..."

count = 0
20.times do
  count + 1
  beer = Beer.create(
    user: User.last,
    name: Faker::Beer.name,
    style: Faker::Beer.style,
    price: prices.sample,
    description: "That's some tasty beer!",
    new: true_false.sample,
    limited: true_false.sample,
    count: rand(10..50)
  )

  beer.photo.attach(
    io: File.open(File.join(Rails.root, "app/assets/images/#{image_link_sources.sample}")),
    filename: "#{count}.jpg",
    content_type: "image/jpg"
  )
end

puts "...Beers made."
