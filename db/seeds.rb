require 'faker'
require 'open-uri'

BookingReview.destroy_all
Booking.destroy_all
Instrument.destroy_all
User.destroy_all

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
#     price: rand(2..50),
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
    category: "String",
    address: "Berlin",
    price: rand(2..50),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Cello.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Violin 1
  instrument = Instrument.create!(
    name: "Wonderful Violin",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "String",
    address: "Berlin",
    price: rand(2..50),
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
    category: "String",
    address: "Berlin",
    price: rand(2..50),
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
    price: rand(2..50),
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
    price: rand(2..50),
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
    price: rand(2..50),
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
    category: "Woodwind",
    address: "Berlin",
    price: rand(2..50),
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
    price: rand(2..50),
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
    price: rand(2..50),
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
    price: rand(2..50),
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
    price: rand(2..50),
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
    price: rand(2..50),
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
    price: rand(2..50),
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
    price: rand(2..50),
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
    price: rand(2..50),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/E_Guitar_Gibson_Les_Paul.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create E Guitar Telecaster
instrument = Instrument.create!(
  name: "Fender Telecaster",
  description: Faker::Lorem.paragraph(sentence_count: 2),
  category: "Guitars",
  address: "Berlin",
  price: rand(2..50),
  user: users.sample
)
# Attach photos to instruments (using image files from the db folder)
photo_path = Rails.root.join("db/seed_images/E_Guitar_Telcaster.webp")
instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
puts "Created #{instrument.name} with a photo."
  # Create Electric Organ
  instrument = Instrument.create!(
    name: "Vintage Electric Organ",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Keys",
    address: "Berlin",
    price: rand(2..50),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Electric_Organ.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Flute
  instrument = Instrument.create!(
    name: "High Quality Flute",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Woodwind",
    address: "Berlin",
    price: rand(2..50),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Flute.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Harp
  instrument = Instrument.create!(
    name: "Beautiful old Harp",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "String",
    address: "Berlin",
    price: rand(2..50),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Harp.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Roland Synthesizer
  instrument = Instrument.create!(
    name: "Classical Roland Synthesizer",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Synthesizer",
    address: "Berlin",
    price: rand(2..50),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Roland_Synthesizer.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Tenor Saxophone
  instrument = Instrument.create!(
    name: "Warm Selmer Tenor Saxophone",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Woodwind",
    address: "Berlin",
    price: rand(2..50),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Saxophone_Spree.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  photo_path = Rails.root.join("db/seed_images/Saxophone.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Sousaphone
  instrument = Instrument.create!(
    name: "Sousaphone Tuba",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Brass",
    address: "Berlin",
    price: rand(2..50),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Sousaphone_Europe.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  photo_path = Rails.root.join("db/seed_images/Sousaphone.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Steeldrum
  instrument = Instrument.create!(
    name: "Modern Steeldrum",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Drums",
    address: "Berlin",
    price: rand(2..50),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Steeldrum.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Korg Synthesizer
  instrument = Instrument.create!(
    name: "Classic Korg Synthesizer",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Synthesizer",
    address: "Berlin",
    price: rand(2..50),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Synthesizer_Korg.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Trumpet
  instrument = Instrument.create!(
    name: "Wonderful Trumpet",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Brass",
    address: "Berlin",
    price: rand(2..50),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Trumpet_red.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  photo_path = Rails.root.join("db/seed_images/Trumpet_Floor.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  photo_path = Rails.root.join("db/seed_images/Trumpet_Bed.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Tuba
  instrument = Instrument.create!(
    name: "Vintage Tuba",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Brass",
    address: "Berlin",
    price: rand(2..50),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Tuba.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  photo_path = Rails.root.join("db/seed_images/Tuba_Brassband.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
# Create Drum Kit
  instrument = Instrument.create!(
    name: "Yamaha Drum Kit",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: "Drums",
    address: "Berlin",
    price: rand(2..50),
    user: users.sample
  )
  # Attach photos to instruments (using image files from the db folder)
  photo_path = Rails.root.join("db/seed_images/Yamaha_Drum_Kit.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."
end

create_instruments_manually
puts "#{Instrument.count} instruments created!"

# Create Bookings
users = User.all
puts "Creating bookings..."
instruments = Instrument.all

100.times do
  start_date = Faker::Date.between(from: Date.today, to: 1.month.from_now)
  end_date = start_date + rand(1..10).days

  instrument = instruments.sample

  # Ensure the user is not the owner of the selected instrument
  booking_user = users.reject { |user| user == instrument.user }.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: booking_user,
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: Booking.statuses.keys.reject { |s| s == "completed" }.sample
  )
end

# Additional bookings for:
user_emails = ["pguelfi@gmail.com", "post@david-dicke.de", "momoelgazzar@gmail.com"]
today = Date.today

user_emails.each do |email|
  user = User.find_by(email: email)

  # Create 4 completed bookings without reviews
  4.times do
    end_date = Faker::Date.between(from: 1.year.ago, to: today - 1.day)
    start_date = Faker::Date.between(from: 1.year.ago, to: end_date)

    instrument = instruments.sample
    booking_user = users.reject { |u| u == instrument.user }.sample

    total_price = (end_date - start_date).to_i * instrument.price

    Booking.create!(
      instrument: instrument,
      user: booking_user,
      start_date: start_date,
      end_date: end_date,
      total_price: total_price,
      status: "completed"
    )
  end

  # Create 6 completed bookings with reviews
  6.times do
    end_date = Faker::Date.between(from: 1.year.ago, to: today - 1.day)
    start_date = Faker::Date.between(from: 1.year.ago, to: end_date)

    instrument = instruments.sample
    booking_user = users.reject { |u| u == instrument.user }.sample

    total_price = (end_date - start_date).to_i * instrument.price

    booking = Booking.create!(
      instrument: instrument,
      user: booking_user,
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
puts "#{BookingReview.count} reviews created!"
puts "Seeding complete!"
