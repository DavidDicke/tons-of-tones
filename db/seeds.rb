# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# db/seeds.rb

# Delete all instruments before deleting users to avoid foreign key violations

Booking.destroy_all
Instrument.destroy_all
User.destroy_all

user1 = User.create!(
  email: 'alice@example.com',
  password: 'password',
  name: 'Alice Wonderland',
  first_name: 'Alice',
  last_name: 'Wonderland'
)

instrument1 = Instrument.create!(
  name: 'Guitar',
  address: '123 Music Lane, Berlin',
  category: 'String',
  price: 20,
  user: user1,
  description: 'An acoustic guitar in great condition.',
  capacity: 1
)

user2 = User.create!(
  email: 'bob@example.com',
  password: 'password',
  name: 'Bob Builder',
  first_name: 'Bob',
  last_name: 'Builder'
)

instrument2 = Instrument.create!(
  name: 'Piano',
  address: '456 Melody Street, Berlin',
  category: 'Keyboard',
  price: 50,
  user: user2,
  description: 'A grand piano available for rent.',
  capacity: 2
)
