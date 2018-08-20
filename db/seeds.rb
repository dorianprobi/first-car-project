require "pry"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting everything......"
Car.delete_all
User.delete_all
Booking.delete_all

puts "Creating users...."
User.create!(email:"joni@web69.de", password:"123456")
User.create!(email:"caspar@gmail.com", password:"123456")

puts "Creating cars...."
Car.create!(brand: "Ferrari", price: 1000, user_as_owner: User.first)
Car.create!(brand: "Seat", price: 10, user_as_owner: User.first)
Car.create!(brand: "Bagger", price: 100, user_as_owner: User.last)

puts "Creating bookings...."
Booking.create!(status: "accepted", starts_at: Date.today, ends_at: Date.today, user: User.last, car: Car.first)

