class BookingReview < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :rating, presence: { message: "Rating can't be blank." }, inclusion: { in: 1..5, message: "Rating must be between 1 and 5." }
  validates :user_id, uniqueness: { scope: :booking_id, message: "You can only review this booking once." }
end
