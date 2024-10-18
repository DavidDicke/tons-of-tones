class BookingReview < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :rating, presence: true
  validates :content, presence: true
  validates :user_id, uniqueness: { scope: :booking_id, message: "You can only review this booking once." }
end
