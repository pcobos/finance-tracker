# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "> Clearing Database..."
puts "> Creating new users..."

10.times do 
  User.new(
    email: Faker::Internet.email,
    encrypted_password: 123456
  )
end

puts "> Done!"