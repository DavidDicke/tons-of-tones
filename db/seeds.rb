require 'faker'
require 'open-uri'

# Clear existing data
Booking.destroy_all
Instrument.destroy_all
User.destroy_all

# Create Users
puts "Creating users..."
User.create!(
  email: "pguelfi@gmail.com",
  password: '123456',
  first_name: "Pablo",
  last_name: "Guelfi"
  )

User.create!(
  email: "post@david-dicke.de",
  password: '123456',
  first_name: "David",
  last_name: "Dicke"
  )

User.create!(
  email: "momoelgazzar@gmail.com",
  password: '123456',
  first_name: "Mohamed",
  last_name: "Elgazzar"
  )

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'password123',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

puts "#{User.count} users created!"

# Create Instruments with attached photos
puts "Creating instruments..."
users = User.all

# Image files in the db/ folder
image_files = [
  "instrument1.jpg",
  "instrument2.jpg",
  "kalimba.webp",
  "violin.avif",
  "guitar.jpg",
  "electric guitar.jpg",
  "trumpet.jpg",
  "drums.jpeg",
  "piano.jpg"
]

50.times do
  instrument = Instrument.create!(
    name: Faker::Music.instrument,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: ['String', 'Keyboard', 'Brass', 'Woodwind', 'Percussion'].sample,
    address: Faker::Address.full_address,
    price: rand(50..500),
    user: users.sample
  )

  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/#{image_files.sample}")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))

  puts "Created #{instrument.name} with a photo."
end

puts "#{Instrument.count} instruments created!"

# Create Bookings
puts "Creating bookings..."
instruments = Instrument.all

100.times do
  start_date = Faker::Date.between(from: Date.today, to: 1.month.from_now)
  end_date = start_date + rand(1..10).days
  total_price = (end_date - start_date).to_i * instruments.sample.price

  Booking.create!(
    instrument: instruments.sample,
    user: users.sample,
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: Booking.statuses.keys.reject { |s| s == "completed" }.sample
  )
end

puts "#{Booking.count} bookings created!"
puts "Seeding complete!"
