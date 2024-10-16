require 'faker'
require 'open-uri'

# Clear existing data
BookingReview.destroy_all  # Clear existing reviews
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
# puts "Creating instruments..."
# users = User.all

# Image files in the db/ folder
# image_files = [
#   "instrument1.jpg",
#   "instrument2.jpg",
#   "kalimba.webp",
#   "violin.avif",
#   "guitar.jpg",
#   "electric guitar.jpg",
#   "trumpet.jpg",
#   "drums.jpeg",
#   "piano.jpg"
# ]

# TODO: Create Real Adresses in Berlin from: https://www.generatormix.com/random-address-in-berlin?number=50

# 50.times do
#   instrument = Instrument.create!(
#     name: Faker::Music.instrument,
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: ['String', 'Keyboard', 'Brass', 'Woodwind', 'Percussion'].sample,
#     address: Faker::Address.full_address,
#     price: rand(50..500),
#     user: users.sample
#   )

#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/#{image_files.sample}")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))

#   puts "Created #{instrument.name} with a photo."
# end
def create_instruments_manually
  puts "Creating instruments..."
  users = User.all
# Create Cello
  instrument = Instrument.create!(
    name: "Beautiful Cello",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Cello",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/cello.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Violin 1
  instrument = Instrument.create!(
    name: "Wonderful Violin",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Violin",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Violin.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Violin 2
  instrument = Instrument.create!(
    name: "Magical Violin",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Violin",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Violin.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Acoustic Guitar 1
  instrument = Instrument.create!(
    name: "Acoustic Western Guitar",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Guitar",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Acoustic_Guitar_Park.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Acoustic Guitar 1
  instrument = Instrument.create!(
    name: "Acoustic Classical Guitar",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Guitar",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Acoustic_Guitar_Stage.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Alphorn
   instrument = Instrument.create!(
    name: "Original Swiss Alphorn",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Brass",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Alphorn.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Clarinet
   instrument = Instrument.create!(
    name: "Brand new Clarinet",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Brass",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Clarinet.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Congas
   instrument = Instrument.create!(
    name: "Congas from Cuba",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Drums",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Congas.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Double Bass
   instrument = Instrument.create!(
    name: "Jazzy Double Bass",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "String",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Double_Bass.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Djembe Drum
  instrument = Instrument.create!(
    name: "Nice Djembe Drum",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Drums",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Drum_Djembe.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Drummachine Digitakt
  instrument = Instrument.create!(
    name: "Drummachine Digitakt",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Drums",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Drummachine_Digitakt.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Drummachine Roland
  instrument = Instrument.create!(
    name: "Drummachine Roland",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Drums",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Drummachine_Roland.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Drummachine NoName
  instrument = Instrument.create!(
    name: "Drummachine - Really Fun",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Drums",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Drummachine.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Drum Traditional
  instrument = Instrument.create!(
    name: "Set of Traditional Drums",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Drums",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Drums_Traditional.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create E Guitar Gibson
  instrument = Instrument.create!(
    name: "Gibson Les Paul",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Guitars",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/E_Guitar_Gibson_Les_Paul.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Electric Organ
  instrument = Instrument.create!(
    name: "Vintage Electric Organ",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Keys",
    address: "Berlin",
    price: rand(50..500),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Electric_Organ.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
end

create_instruments_manually
puts "#{Instrument.count} instruments created!"

# Create Bookings
users = User.all
puts "Creating bookings..."
instruments = Instrument.all

# Create 100 random bookings
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

# Additional bookings for specific users
user_emails = ["pguelfi@gmail.com", "post@david-dicke.de", "momoelgazzar@gmail.com"]
today = Date.today

user_emails.each do |email|
  user = User.find_by(email: email)

  # Create 2 completed bookings without reviews
  2.times do
    end_date = Faker::Date.between(from: 1.year.ago, to: today - 1.day)
    start_date = Faker::Date.between(from: 1.year.ago, to: end_date)

    total_price = (end_date - start_date).to_i * instruments.sample.price

    Booking.create!(
      instrument: instruments.sample,
      user: user,
      start_date: start_date,
      end_date: end_date,
      total_price: total_price,
      status: "completed"
    )
  end

  # Create 3 completed bookings with reviews
  3.times do
    end_date = Faker::Date.between(from: 1.year.ago, to: today - 1.day)
    start_date = Faker::Date.between(from: 1.year.ago, to: end_date)

    total_price = (end_date - start_date).to_i * instruments.sample.price

    booking = Booking.create!(
      instrument: instruments.sample,
      user: user,
      start_date: start_date,
      end_date: end_date,
      total_price: total_price,
      status: "completed"
    )

    # Create a review for each completed booking
    BookingReview.create!(
      content: Faker::Lorem.sentence,
      rating: rand(1..5),
      user: user,
      booking: booking
    )
  end
end

puts "#{Booking.count} bookings created!"
puts "#{BookingReview.count} reviews created!"  # Add this line to show the number of created reviews
puts "Seeding complete!"
