puts "Deleting everything......"
Booking.delete_all
Car.delete_all
User.delete_all

puts "Creating users...."
User.create!(email:"joni@web69.de", password:"123456")
User.create!(email:"caspar@gmail.com", password:"123456")

puts "Creating cars...."

Car.create!(
  brand: "Mercedes-Benz Pagode",
  remote_photo_url: "http://www.limos-mieten.de/wp-content/uploads/2015/06/Mercedes-Pagode-Oldtimer-Vermietung-Siegen-leihen-Hochzeit-Mietwagen-Cabrio-Cabriolet.jpg",
  price: 200,
  user_as_owner: User.first
)
Car.create!(
  brand: "Mercedes-Benz 180 SL",
  remote_photo_url: "http://orig09.deviantart.net/13e7/f/2012/180/a/b/mercedes_190_sl_roadster_by_sylverraptor-d55ctvs.jpg",
  price: 500,
  user_as_owner: User.first
)

Car.create!(
  brand: "Mercedes-Benz 300 SL",
  remote_photo_url: "http://pictures.4ever.eu/data/download/cars/artistic/mercedes-benz-sl,-oldtimer,-door,-clouds-228769.jpg",
  price: 750,
  user_as_owner: User.first
)

Car.create!(
  brand: "Mercedes-Benz 540 K Spezial",
  remote_photo_url: "http://www.tapeciarnia.pl/tapety/normalne/53336_mercedesbenz_540k_spezial_roadster.jpg",
  price: 1000,
  user_as_owner: User.last
)

Car.create!(
  brand: "Mercedes-Benz 300 SLR Le Mans 1955",
  remote_photo_url: "http://www.autospies.com/images/users/AMoldero/main/mercedes-benz_300_slr_1955_01.jpg",
  price: 1100,
  user_as_owner: User.last
)




puts "Creating bookings...."
Booking.create!(status: "accepted", starts_at: Date.today, ends_at: Date.today, user: User.last, car: Car.first)

