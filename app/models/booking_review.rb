class BookingReview < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :user_id, uniqueness: { scope: :booking_id, message: "You can only review this booking once." }
end
