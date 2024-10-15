class User < ApplicationRecord
  has_one_attached :photo
  has_many :instruments
  has_many :bookings
  has_many :booking_reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
