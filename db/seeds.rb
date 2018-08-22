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
Car.create!(brand: "Mercedes-Benz 180 SL", photo:"180SL.jpg" ,price: 30, user_as_owner: User.first)
Car.create!(brand: "Mercedes-Benz 300 SL", photo:"300-SL-AMG-1.jpg" ,price: 26, user_as_owner: User.first)
Car.create!(brand: "Mercedes-Benz 540 K Spezial", photo:"540K.jpeg",price: 45, user_as_owner: User.last)
Car.create!(brand: "Mercedes-Benz Pagode", photo:"Pagode.jpeg" ,price: 34, user_as_owner: User.last)


puts "Creating bookings...."
Booking.create!(status: "accepted", starts_at: Date.today, ends_at: Date.today, user: User.last, car: Car.first)

