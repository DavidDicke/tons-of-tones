class Instrument < ApplicationRecord
  belongs_to :user
  has_many_attached :photos, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :booking_reviews, through: :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :address, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
end
