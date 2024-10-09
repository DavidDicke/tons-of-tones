# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create!(
  first_name: 'Sample First Name',
  last_name: 'Sample Last Name',
  email: 'unique_user@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)

Instrument.create!([
  { name: 'Guitar', description: 'An acoustic guitar.', capacity: 1, address: '123 Music Lane', price: 100.0, user_id: user.id },
  { name: 'Piano', description: 'A grand piano.', capacity: 2, address: '456 Melody St.', price: 200.0, user_id: user.id }
])
