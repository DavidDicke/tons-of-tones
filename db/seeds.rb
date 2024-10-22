require 'faker'
require 'open-uri'

BookingReview.destroy_all
Booking.destroy_all
Instrument.destroy_all
User.destroy_all

puts "Creating users..."
# Create the first user and attach a photo
user1 = User.create!(
  email: "pguelfi@gmail.com",
  password: '123456',
  first_name: "Pablo",
  last_name: "Guelfi"
)
photo_path = Rails.root.join("db/seed_images/p-guelfi.jpg")
user1.photo.attach(io: File.open(photo_path), filename: File.basename(photo_path))

# Create the second user and attach a photo
user2 = User.create!(
  email: "post@david-dicke.de",
  password: '123456',
  first_name: "David",
  last_name: "Dicke"
)
photo_path = Rails.root.join("db/seed_images/David.jpeg")
user2.photo.attach(io: File.open(photo_path), filename: File.basename(photo_path))

# Create the third user and attach a photo
user3 = User.create!(
  email: "momoelgazzar@gmail.com",
  password: '123456',
  first_name: "Mohamed",
  last_name: "Elgazzar"
)
photo_path = Rails.root.join("db/seed_images/Mohamed.jpeg")
user3.photo.attach(io: File.open(photo_path), filename: File.basename(photo_path))

# 10.times do
#   User.create!(
#     email: Faker::Internet.email,
#     password: 'password123',
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name
#   )
# end

puts "#{User.count} users created!"



# TODO: Create Real Adresses in Weserstr. 21,  Berlin, Germany from: https://www.generatormix.com/random-address-in-Weserstr. 21,  Berlin, Germany?number=50



# def create_instruments_manually
#   puts "Creating instruments..."
#   users = User.all
# # Create Cello
#   instrument = Instrument.create!(
#     name: "Beautiful Cello",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "String",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Cello.webp")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Violin 1
#   instrument = Instrument.create!(
#     name: "Wonderful Violin",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "String",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Violin.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Violin 2
#   instrument = Instrument.create!(
#     name: "Magical Violin",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "String",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Violin.webp")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Acoustic Guitar 1
#   instrument = Instrument.create!(
#     name: "Acoustic Western Guitar",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Guitar",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Acoustic_Guitar_Park.webp")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Acoustic Guitar 1
#   instrument = Instrument.create!(
#     name: "Acoustic Classical Guitar",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Guitar",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Acoustic_Guitar_Stage.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Alphorn
#    instrument = Instrument.create!(
#     name: "Original Swiss Alphorn",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Brass",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Alphorn.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Clarinet
#    instrument = Instrument.create!(
#     name: "Brand new Clarinet",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Woodwind",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Clarinet.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Congas
#    instrument = Instrument.create!(
#     name: "Congas from Cuba",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Drums",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Congas.webp")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Double Bass
#    instrument = Instrument.create!(
#     name: "Jazzy Double Bass",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "String",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Double_Bass.webp")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Djembe Drum
#   instrument = Instrument.create!(
#     name: "Nice Djembe Drum",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Drums",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Drum_Djembe.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Drummachine Digitakt
#   instrument = Instrument.create!(
#     name: "Drummachine Digitakt",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Drums",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Drummachine_Digitakt.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Drummachine Roland
#   instrument = Instrument.create!(
#     name: "Drummachine Roland",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Drums",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Drummachine_Roland.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Drummachine NoName
#   instrument = Instrument.create!(
#     name: "Drummachine - Really Fun",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Drums",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Drummachine.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Drum Traditional
#   instrument = Instrument.create!(
#     name: "Set of Traditional Drums",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Drums",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Drums_Traditional.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create E Guitar Gibson
#   instrument = Instrument.create!(
#     name: "Gibson Les Paul",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Guitars",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/E_Guitar_Gibson_Les_Paul.webp")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create E Guitar Telecaster
# instrument = Instrument.create!(
#   name: "Fender Telecaster",
#   description: Faker::Lorem.paragraph(sentence_count: 2),
#   category: "Guitars",
#   address: berlin_addresses.sample,
#   price: rand(2..50),
#   user: users.sample
# )
# # Attach photos to instruments (using image files from the db folder)
# photo_path = Rails.root.join("db/seed_images/E_Guitar_Telecaster.webp")
# instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
# puts "Created #{instrument.name} with a photo."
#   # Create Electric Organ
#   instrument = Instrument.create!(
#     name: "Vintage Electric Organ",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Keys",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Electric_Organ.webp")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Flute
#   instrument = Instrument.create!(
#     name: "High Quality Flute",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Woodwind",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Flute.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Harp
#   instrument = Instrument.create!(
#     name: "Beautiful old Harp",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "String",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Harp.webp")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Roland Synthesizer
#   instrument = Instrument.create!(
#     name: "Classical Roland Synthesizer",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Synthesizer",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Roland_Synthesizer.webp")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Tenor Saxophone
#   instrument = Instrument.create!(
#     name: "Warm Selmer Tenor Saxophone",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Woodwind",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Saxophone_Spree.webp")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   photo_path = Rails.root.join("db/seed_images/Saxophone.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Sousaphone
#   instrument = Instrument.create!(
#     name: "Sousaphone Tuba",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Brass",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Sousaphone_Europe.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   photo_path = Rails.root.join("db/seed_images/Sousaphone.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Steeldrum
#   instrument = Instrument.create!(
#     name: "Modern Steeldrum",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Drums",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Steeldrum.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Korg Synthesizer
#   instrument = Instrument.create!(
#     name: "Classic Korg Synthesizer",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Synthesizer",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Synthesizer_Korg.webp")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Trumpet
#   instrument = Instrument.create!(
#     name: "Wonderful Trumpet",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Brass",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Trumpet_red.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   photo_path = Rails.root.join("db/seed_images/Trumpet_Floor.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   photo_path = Rails.root.join("db/seed_images/Trumpet_Bed.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Tuba
#   instrument = Instrument.create!(
#     name: "Vintage Tuba",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Brass",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Tuba.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   photo_path = Rails.root.join("db/seed_images/Tuba_Brassband.jpg")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# # Create Drum Kit
#   instrument = Instrument.create!(
#     name: "Yamaha Drum Kit",
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     category: "Drums",
#     address: berlin_addresses.sample,
#     price: rand(2..50),
#     user: users.sample
#   )
#   # Attach photos to instruments (using image files from the db folder)
#   photo_path = Rails.root.join("db/seed_images/Yamaha_Drum_Kit.webp")
#   instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
#   puts "Created #{instrument.name} with a photo."
# end

# Manual Instruments Seed with descriptions by chatgpt:


def create_instruments_manually
  puts "Creating instruments..."
  users = User.all

  berlin_addresses = [
    "Alexanderplatz 1, 10178 Berlin, Germany",
    "Kurfürstendamm 45, 10719 Berlin, Germany",
    "Oranienstraße 14a, 10999 Berlin, Germany",
    "Schönhauser Allee 80, 10439 Berlin, Germany",
    "Karl-Marx-Straße 130, 12043 Berlin, Germany",
    "Hardenbergstraße 27, 10623 Berlin, Germany",
    "Warschauer Straße 34, 10243 Berlin, Germany",
    "Görlitzer Straße 2, 10997 Berlin, Germany",
    "Potsdamer Platz 10, 10785 Berlin, Germany",
    "Frankfurter Allee 50, 10247 Berlin, Germany"
  ]
  # Create Cello
  instrument = Instrument.create!(
    name: "Beautiful Cello",
    description: "A rich-sounding cello perfect for orchestral performances and solo recitals. Deep, resonant tones.",
    category: "String",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Cello.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Violin 1
  instrument = Instrument.create!(
    name: "Wonderful Violin",
    description: "This violin delivers an exquisite, warm sound. Ideal for both beginners and professionals.",
    category: "String",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Violin.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Violin 2
  instrument = Instrument.create!(
    name: "Magical Violin",
    description: "A handcrafted violin with impeccable sound clarity. A magical choice for any performance.",
    category: "String",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Violin.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Acoustic Western Guitar
  instrument = Instrument.create!(
    name: "Acoustic Western Guitar",
    description: "A Western guitar with bright, resonant tones—great for folk and country music.",
    category: "Guitar",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Acoustic_Guitar_Park.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Acoustic Classical Guitar
  instrument = Instrument.create!(
    name: "Acoustic Classical Guitar",
    description: "A classic guitar with warm, mellow tones, perfect for classical and flamenco.",
    category: "Guitar",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Acoustic_Guitar_Stage.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Alphorn
  instrument = Instrument.create!(
    name: "Original Swiss Alphorn",
    description: "Traditional Swiss Alphorn with deep, majestic sounds. Perfect for outdoor performances.",
    category: "Brass",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Alphorn.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Clarinet
  instrument = Instrument.create!(
    name: "Brand new Clarinet",
    description: "A brand new clarinet with clear, rich tones for both beginners and experts.",
    category: "Woodwind",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Clarinet.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Congas
  instrument = Instrument.create!(
    name: "Congas from Cuba",
    description: "Handmade Cuban congas with authentic, earthy beats. Great for Latin rhythms.",
    category: "Drums",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Congas.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Double Bass
  instrument = Instrument.create!(
    name: "Jazzy Double Bass",
    description: "A jazzy double bass, delivering rich, smooth lows. Perfect for jazz or orchestral use.",
    category: "String",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Double_Bass.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Djembe Drum
  instrument = Instrument.create!(
    name: "Nice Djembe Drum",
    description: "This djembe offers powerful, deep tones. Handcrafted and ideal for drum circles.",
    category: "Drums",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Drum_Djembe.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Drummachine Digitakt
  instrument = Instrument.create!(
    name: "Drummachine Digitakt",
    description: "A versatile, all-in-one drum machine with an array of electronic beats.",
    category: "Drums",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Drummachine_Digitakt.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Drummachine Roland
  instrument = Instrument.create!(
    name: "Drummachine Roland",
    description: "Classic Roland drum machine. Iconic sounds for electronic music enthusiasts.",
    category: "Drums",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Drummachine_Roland.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Drummachine NoName
  instrument = Instrument.create!(
    name: "Drummachine - Really Fun",
    description: "A budget-friendly drummachine, offering fun beats and endless creativity.",
    category: "Drums",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Drummachine.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Traditional Drum Set
  instrument = Instrument.create!(
    name: "Set of Traditional Drums",
    description: "A beautiful set of traditional drums, crafted for deep, resonant rhythms.",
    category: "Drums",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Drums_Traditional.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create E Guitar Gibson
  instrument = Instrument.create!(
    name: "Gibson Les Paul",
    description: "A legendary Gibson Les Paul with signature rock tones. Perfect for stage performances.",
    category: "Guitar",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/E_Guitar_Gibson_Les_Paul.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create E Guitar Telecaster
  instrument = Instrument.create!(
    name: "Fender Telecaster",
    description: "A Fender Telecaster delivering sharp, twangy tones. Perfect for rock and country.",
    category: "Guitar",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/E_Guitar_Telecaster.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Electric Organ
  instrument = Instrument.create!(
    name: "Vintage Electric Organ",
    description: "Vintage electric organ with lush, warm tones. Perfect for jazz and soul music.",
    category: "Keys",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Electric_Organ.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."



  # Create Flute
  instrument = Instrument.create!(
    name: "High Quality Flute",
    description: "A premium flute with smooth and clear tones, suitable for orchestral performances or soloists.",
    category: "Woodwind",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Flute.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Harp
  instrument = Instrument.create!(
    name: "Beautiful old Harp",
    description: "A vintage harp with a heavenly sound, ideal for classical music or soothing performances.",
    category: "String",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Harp.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Roland Synthesizer
  instrument = Instrument.create!(
    name: "Classical Roland Synthesizer",
    description: "A versatile Roland synthesizer, perfect for electronic music production and live performances.",
    category: "Synthesizer",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Roland_Synthesizer.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Tenor Saxophone
  instrument = Instrument.create!(
    name: "Warm Selmer Tenor Saxophone",
    description: "A Selmer tenor saxophone with rich, warm tones, perfect for jazz and classical music.",
    category: "Woodwind",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Saxophone_Spree.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  photo_path = Rails.root.join("db/seed_images/Saxophone.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Sousaphone
  instrument = Instrument.create!(
    name: "Sousaphone Tuba",
    description: "A large, powerful brass instrument with deep tones, perfect for marching bands and orchestras.",
    category: "Brass",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Sousaphone_Europe.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  photo_path = Rails.root.join("db/seed_images/Sousaphone.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Steeldrum
  instrument = Instrument.create!(
    name: "Modern Steeldrum",
    description: "A handcrafted steeldrum with a melodious and vibrant tone, perfect for Caribbean rhythms.",
    category: "Drums",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Steeldrum.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Korg Synthesizer
  instrument = Instrument.create!(
    name: "Classic Korg Synthesizer",
    description: "A classic Korg synthesizer known for its versatility and rich soundscapes.",
    category: "Synthesizer",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Synthesizer_Korg.webp")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Trumpet
  instrument = Instrument.create!(
    name: "Wonderful Trumpet",
    description: "A bright and bold trumpet with a crisp sound, suitable for jazz, classical, and marching bands.",
    category: "Brass",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
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
    description: "A rich-sounding vintage tuba that delivers deep and resonant notes, ideal for brass ensembles.",
    category: "Brass",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
  photo_path = Rails.root.join("db/seed_images/Tuba.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  photo_path = Rails.root.join("db/seed_images/Tuba_Brassband.jpg")
  instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  puts "Created #{instrument.name} with a photo."

  # Create Drum Kit
  instrument = Instrument.create!(
    name: "Yamaha Drum Kit",
    description: "A high-quality Yamaha drum kit, providing powerful and balanced tones for any genre.",
    category: "Drums",
    address: berlin_addresses.sample,
    price: rand(2..50),
    user: users.sample
  )
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

# 50.times do
#   start_date = Faker::Date.between(from: Date.today, to: 1.month.from_now)
#   end_date = start_date + rand(1..10).days

#   instrument = instruments.sample

#   # Ensure the user is not the owner of the selected instrument
#   booking_user = users.reject { |user| user == instrument.user }.sample

#   total_price = (end_date - start_date).to_i * instrument.price

#   Booking.create!(
#     instrument: instrument,
#     user: booking_user,
#     start_date: start_date,
#     end_date: end_date,
#     total_price: total_price,
#     status: Booking.statuses.keys.reject { |s| s == "completed" }.sample
#   )
# end


# Additional bookings for: "pguelfi@gmail.com", "post@david-dicke.de", "momoelgazzar@gmail.com"

# 1 Completed borrowing::

3.times do
  user_email = "pguelfi@gmail.com"
  user = User.find_by(email: user_email)
  today = Date.today

  end_date = Faker::Date.between(from: 1.year.ago, to: today - 1.day)
  start_date = Faker::Date.between(from: 1.year.ago, to: end_date)

  # Reject instruments belonging to the user
  available_instruments = Instrument.all.reject { |instrument| instrument.user == user }

  # Ensure there's at least one available instrument
  next if available_instruments.empty?

  instrument = available_instruments.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: user,  # Use the current user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "completed"
  )
end

# 2 Completed lending:

3.times do
  # Define the user email for the instrument owner
  user_email = "pguelfi@gmail.com"
  instrument_owner = User.find_by(email: user_email)
  today = Date.today

  end_date = Faker::Date.between(from: 1.year.ago, to: today - 1.day)
  start_date = Faker::Date.between(from: 1.year.ago, to: end_date)

  # Select an instrument belonging to the user (instrument owner)
  instrument = Instrument.find_by(user: instrument_owner)

  # Ensure that the instrument exists
  next if instrument.nil?

  # Select a booking user who is not the instrument owner
  booking_user = users.reject { |u| u == instrument.user }.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: booking_user,  # Use a different user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "completed"
  )
end

# 3 Pending borrowing:
2.times do
  user_email = "pguelfi@gmail.com"
  user = User.find_by(email: user_email)
  today = Date.today

  # Generate future dates for the booking
  start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
  end_date = start_date + rand(1..10).days

  # Reject instruments belonging to the user
  available_instruments = Instrument.all.reject { |instrument| instrument.user == user }

  # Ensure there's at least one available instrument
  next if available_instruments.empty?

  instrument = available_instruments.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: user,  # Use the current user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "pending"  # Set status to pending
  )
end

# 4 Pending lending

2.times do
  # Define the user email for the instrument owner
  user_email = "pguelfi@gmail.com"
  instrument_owner = User.find_by(email: user_email)
  today = Date.today

  # Generate future dates for the booking
  start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
  end_date = start_date + rand(1..10).days

  # Select an instrument belonging to the user (instrument owner)
  instrument = Instrument.find_by(user: instrument_owner)

  # Ensure that the instrument exists
  next if instrument.nil?

  # Select a booking user who is not the instrument owner
  booking_user = users.reject { |u| u == instrument.user }.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: booking_user,  # Use a different user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "pending"  # Set status to pending
  )
end

# 5 Confirmed borrowing:
# 2.times do
#   user_email = "pguelfi@gmail.com"
#   user = User.find_by(email: user_email)
#   today = Date.today

#   # Generate future dates for the booking
#   start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
#   end_date = start_date + rand(1..10).days

#   # Reject instruments belonging to the user
#   available_instruments = Instrument.all.reject { |instrument| instrument.user == user }

#   # Ensure there's at least one available instrument
#   next if available_instruments.empty?

#   instrument = available_instruments.sample

#   total_price = (end_date - start_date).to_i * instrument.price

#   Booking.create!(
#     instrument: instrument,
#     user: user,  # Use the current user for the booking
#     start_date: start_date,
#     end_date: end_date,
#     total_price: total_price,
#     status: "confirmed"  # Set status to pending
#   )
# end

# 6 Confirmed lending

# 2.times do
#   # Define the user email for the instrument owner
#   user_email = "pguelfi@gmail.com"
#   instrument_owner = User.find_by(email: user_email)
#   today = Date.today

#   # Generate future dates for the booking
#   start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
#   end_date = start_date + rand(1..10).days

#   # Select an instrument belonging to the user (instrument owner)
#   instrument = Instrument.find_by(user: instrument_owner)

#   # Ensure that the instrument exists
#   next if instrument.nil?

#   # Select a booking user who is not the instrument owner
#   booking_user = users.reject { |u| u == instrument.user }.sample

#   total_price = (end_date - start_date).to_i * instrument.price

#   Booking.create!(
#     instrument: instrument,
#     user: booking_user,  # Use a different user for the booking
#     start_date: start_date,
#     end_date: end_date,
#     total_price: total_price,
#     status: "confirmed"  # Set status to pending
#   )
# end


# 7 Cancelled borrowing:
1.times do
  user_email = "pguelfi@gmail.com"
  user = User.find_by(email: user_email)
  today = Date.today

  # Generate future dates for the booking
  start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
  end_date = start_date + rand(1..10).days

  # Reject instruments belonging to the user
  available_instruments = Instrument.all.reject { |instrument| instrument.user == user }

  # Ensure there's at least one available instrument
  next if available_instruments.empty?

  instrument = available_instruments.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: user,  # Use the current user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "cancelled"  # Set status to pending
  )
end

# 8 Cancelled lending

1.times do
  # Define the user email for the instrument owner
  user_email = "pguelfi@gmail.com"
  instrument_owner = User.find_by(email: user_email)
  today = Date.today

  # Generate future dates for the booking
  start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
  end_date = start_date + rand(1..10).days

  # Select an instrument belonging to the user (instrument owner)
  instrument = Instrument.find_by(user: instrument_owner)

  # Ensure that the instrument exists
  next if instrument.nil?

  # Select a booking user who is not the instrument owner
  booking_user = users.reject { |u| u == instrument.user }.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: booking_user,  # Use a different user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "confirmed"  # Set status to pending
  )
end



# 1 Completed borrowing::

3.times do
  user_email = "post@david-dicke.de"
  user = User.find_by(email: user_email)
  today = Date.today

  end_date = Faker::Date.between(from: 1.year.ago, to: today - 1.day)
  start_date = Faker::Date.between(from: 1.year.ago, to: end_date)

  # Reject instruments belonging to the user
  available_instruments = Instrument.all.reject { |instrument| instrument.user == user }

  # Ensure there's at least one available instrument
  next if available_instruments.empty?

  instrument = available_instruments.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: user,  # Use the current user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "completed"
  )
end

# 2 Completed lending:

3.times do
  # Define the user email for the instrument owner
  user_email = "post@david-dicke.de"
  instrument_owner = User.find_by(email: user_email)
  today = Date.today

  end_date = Faker::Date.between(from: 1.year.ago, to: today - 1.day)
  start_date = Faker::Date.between(from: 1.year.ago, to: end_date)

  # Select an instrument belonging to the user (instrument owner)
  instrument = Instrument.find_by(user: instrument_owner)

  # Ensure that the instrument exists
  next if instrument.nil?

  # Select a booking user who is not the instrument owner
  booking_user = users.reject { |u| u == instrument.user }.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: booking_user,  # Use a different user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "completed"
  )
end

# 3 Pending borrowing:
2.times do
  user_email = "post@david-dicke.de"
  user = User.find_by(email: user_email)
  today = Date.today

  # Generate future dates for the booking
  start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
  end_date = start_date + rand(1..10).days

  # Reject instruments belonging to the user
  available_instruments = Instrument.all.reject { |instrument| instrument.user == user }

  # Ensure there's at least one available instrument
  next if available_instruments.empty?

  instrument = available_instruments.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: user,  # Use the current user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "pending"  # Set status to pending
  )
end

# 4 Pending lending

2.times do
  # Define the user email for the instrument owner
  user_email = "post@david-dicke.de"
  instrument_owner = User.find_by(email: user_email)
  today = Date.today

  # Generate future dates for the booking
  start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
  end_date = start_date + rand(1..10).days

  # Select an instrument belonging to the user (instrument owner)
  instrument = Instrument.find_by(user: instrument_owner)

  # Ensure that the instrument exists
  next if instrument.nil?

  # Select a booking user who is not the instrument owner
  booking_user = users.reject { |u| u == instrument.user }.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: booking_user,  # Use a different user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "pending"  # Set status to pending
  )
end

# 5 Confirmed borrowing:
# 2.times do
#   user_email = "post@david-dicke.de"
#   user = User.find_by(email: user_email)
#   today = Date.today

#   # Generate future dates for the booking
#   start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
#   end_date = start_date + rand(1..10).days

#   # Reject instruments belonging to the user
#   available_instruments = Instrument.all.reject { |instrument| instrument.user == user }

#   # Ensure there's at least one available instrument
#   next if available_instruments.empty?

#   instrument = available_instruments.sample

#   total_price = (end_date - start_date).to_i * instrument.price

#   Booking.create!(
#     instrument: instrument,
#     user: user,  # Use the current user for the booking
#     start_date: start_date,
#     end_date: end_date,
#     total_price: total_price,
#     status: "confirmed"  # Set status to pending
#   )
# end

# 6 Confirmed lending

# 2.times do
#   # Define the user email for the instrument owner
#   user_email = "post@david-dicke.de"
#   instrument_owner = User.find_by(email: user_email)
#   today = Date.today

#   # Generate future dates for the booking
#   start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
#   end_date = start_date + rand(1..10).days

#   # Select an instrument belonging to the user (instrument owner)
#   instrument = Instrument.find_by(user: instrument_owner)

#   # Ensure that the instrument exists
#   next if instrument.nil?

#   # Select a booking user who is not the instrument owner
#   booking_user = users.reject { |u| u == instrument.user }.sample

#   total_price = (end_date - start_date).to_i * instrument.price

#   Booking.create!(
#     instrument: instrument,
#     user: booking_user,  # Use a different user for the booking
#     start_date: start_date,
#     end_date: end_date,
#     total_price: total_price,
#     status: "confirmed"  # Set status to pending
#   )
# end


# 7 Cancelled borrowing:
1.times do
  user_email = "post@david-dicke.de"
  user = User.find_by(email: user_email)
  today = Date.today

  # Generate future dates for the booking
  start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
  end_date = start_date + rand(1..10).days

  # Reject instruments belonging to the user
  available_instruments = Instrument.all.reject { |instrument| instrument.user == user }

  # Ensure there's at least one available instrument
  next if available_instruments.empty?

  instrument = available_instruments.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: user,  # Use the current user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "cancelled"  # Set status to pending
  )
end

# 8 Cancelled lending

1.times do
  # Define the user email for the instrument owner
  user_email = "post@david-dicke.de"
  instrument_owner = User.find_by(email: user_email)
  today = Date.today

  # Generate future dates for the booking
  start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
  end_date = start_date + rand(1..10).days

  # Select an instrument belonging to the user (instrument owner)
  instrument = Instrument.find_by(user: instrument_owner)

  # Ensure that the instrument exists
  next if instrument.nil?

  # Select a booking user who is not the instrument owner
  booking_user = users.reject { |u| u == instrument.user }.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: booking_user,  # Use a different user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "confirmed"  # Set status to pending
  )
end



# 1 Completed borrowing::

3.times do
  user_email = "momoelgazzar@gmail.com"
  user = User.find_by(email: user_email)
  today = Date.today

  end_date = Faker::Date.between(from: 1.year.ago, to: today - 1.day)
  start_date = Faker::Date.between(from: 1.year.ago, to: end_date)

  # Reject instruments belonging to the user
  available_instruments = Instrument.all.reject { |instrument| instrument.user == user }

  # Ensure there's at least one available instrument
  next if available_instruments.empty?

  instrument = available_instruments.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: user,  # Use the current user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "completed"
  )
end

# 2 Completed lending:

3.times do
  # Define the user email for the instrument owner
  user_email = "momoelgazzar@gmail.com"
  instrument_owner = User.find_by(email: user_email)
  today = Date.today

  end_date = Faker::Date.between(from: 1.year.ago, to: today - 1.day)
  start_date = Faker::Date.between(from: 1.year.ago, to: end_date)

  # Select an instrument belonging to the user (instrument owner)
  instrument = Instrument.find_by(user: instrument_owner)

  # Ensure that the instrument exists
  next if instrument.nil?

  # Select a booking user who is not the instrument owner
  booking_user = users.reject { |u| u == instrument.user }.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: booking_user,  # Use a different user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "completed"
  )
end

# 3 Pending borrowing:
2.times do
  user_email = "momoelgazzar@gmail.com"
  user = User.find_by(email: user_email)
  today = Date.today

  # Generate future dates for the booking
  start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
  end_date = start_date + rand(1..10).days

  # Reject instruments belonging to the user
  available_instruments = Instrument.all.reject { |instrument| instrument.user == user }

  # Ensure there's at least one available instrument
  next if available_instruments.empty?

  instrument = available_instruments.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: user,  # Use the current user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "pending"  # Set status to pending
  )
end

# 4 Pending lending

2.times do
  # Define the user email for the instrument owner
  user_email = "momoelgazzar@gmail.com"
  instrument_owner = User.find_by(email: user_email)
  today = Date.today

  # Generate future dates for the booking
  start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
  end_date = start_date + rand(1..10).days

  # Select an instrument belonging to the user (instrument owner)
  instrument = Instrument.find_by(user: instrument_owner)

  # Ensure that the instrument exists
  next if instrument.nil?

  # Select a booking user who is not the instrument owner
  booking_user = users.reject { |u| u == instrument.user }.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: booking_user,  # Use a different user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "pending"  # Set status to pending
  )
end

# 5 Confirmed borrowing:
# 2.times do
#   user_email = "momoelgazzar@gmail.com"
#   user = User.find_by(email: user_email)
#   today = Date.today

#   # Generate future dates for the booking
#   start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
#   end_date = start_date + rand(1..10).days

#   # Reject instruments belonging to the user
#   available_instruments = Instrument.all.reject { |instrument| instrument.user == user }

#   # Ensure there's at least one available instrument
#   next if available_instruments.empty?

#   instrument = available_instruments.sample

#   total_price = (end_date - start_date).to_i * instrument.price

#   Booking.create!(
#     instrument: instrument,
#     user: user,  # Use the current user for the booking
#     start_date: start_date,
#     end_date: end_date,
#     total_price: total_price,
#     status: "confirmed"  # Set status to pending
#   )
# end

# 6 Confirmed lending

# 2.times do
#   # Define the user email for the instrument owner
#   user_email = "momoelgazzar@gmail.com"
#   instrument_owner = User.find_by(email: user_email)
#   today = Date.today

#   # Generate future dates for the booking
#   start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
#   end_date = start_date + rand(1..10).days

#   # Select an instrument belonging to the user (instrument owner)
#   instrument = Instrument.find_by(user: instrument_owner)

#   # Ensure that the instrument exists
#   next if instrument.nil?

#   # Select a booking user who is not the instrument owner
#   booking_user = users.reject { |u| u == instrument.user }.sample

#   total_price = (end_date - start_date).to_i * instrument.price

#   Booking.create!(
#     instrument: instrument,
#     user: booking_user,  # Use a different user for the booking
#     start_date: start_date,
#     end_date: end_date,
#     total_price: total_price,
#     status: "confirmed"  # Set status to pending
#   )
# end


# 7 Cancelled borrowing:
1.times do
  user_email = "momoelgazzar@gmail.com"
  user = User.find_by(email: user_email)
  today = Date.today

  # Generate future dates for the booking
  start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
  end_date = start_date + rand(1..10).days

  # Reject instruments belonging to the user
  available_instruments = Instrument.all.reject { |instrument| instrument.user == user }

  # Ensure there's at least one available instrument
  next if available_instruments.empty?

  instrument = available_instruments.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: user,  # Use the current user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "cancelled"  # Set status to pending
  )
end

# 8 Cancelled lending

1.times do
  # Define the user email for the instrument owner
  user_email = "momoelgazzar@gmail.com"
  instrument_owner = User.find_by(email: user_email)
  today = Date.today

  # Generate future dates for the booking
  start_date = Faker::Date.between(from: today + 1.day, to: today + 1.month)
  end_date = start_date + rand(1..10).days

  # Select an instrument belonging to the user (instrument owner)
  instrument = Instrument.find_by(user: instrument_owner)

  # Ensure that the instrument exists
  next if instrument.nil?

  # Select a booking user who is not the instrument owner
  booking_user = users.reject { |u| u == instrument.user }.sample

  total_price = (end_date - start_date).to_i * instrument.price

  Booking.create!(
    instrument: instrument,
    user: booking_user,  # Use a different user for the booking
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    status: "confirmed"  # Set status to pending
  )
end



  # Reviews for 50% of completed bookings
  completed_bookings = Booking.where(status: 4)

  # Randomly select 50% of the completed bookings
  bookings_to_review = completed_bookings.sample(completed_bookings.count / 2)

  # Define an array of generic review texts for BookingReview (about the instrument)
  review_texts = [
    "The instrument was in excellent condition and exceeded my expectations. I would highly recommend it to anyone looking for quality!",
    "I had a fantastic experience using this instrument. It was easy to handle and sounded great throughout my booking period.",
    "This instrument was perfect for my needs. It performed well and was very well maintained. I would definitely rent it again!",
    "I was very pleased with this instrument. It met all my requirements and made my experience enjoyable. Thank you!"
  ]

  # Define an array of generic review texts for UserReview (about the renter)
  user_review_texts = [
    "The renter took great care of the instrument and returned it in perfect condition. I would happily rent to them again!",
    "I had a positive experience with this renter. They communicated well and treated the instrument with respect.",
    "The instrument was returned on time and in excellent shape. I highly recommend this renter!",
    "This renter was reliable and responsible. I appreciate how well they handled the instrument during the rental period."
  ]

  bookings_to_review.each do |booking|
    # Create a BookingReview for the instrument
    BookingReview.create!(
      content: review_texts.sample, # Sample a random review text about the instrument
      rating: rand(1..5),
      user: booking.user, # The user who rented the instrument (created the booking)
      booking: booking
    )

    # Create a UserReview for the renter
    UserReview.create!(
      content: user_review_texts.sample, # Sample a random review text about the renter
      rating: rand(1..5),
      user: booking.instrument.user, # The owner of the instrument reviewing the renter
      booking: booking
    )
  end

puts "#{Booking.count} bookings created!"
puts "#{BookingReview.count} reviews created!"
puts "Seeding complete!"
