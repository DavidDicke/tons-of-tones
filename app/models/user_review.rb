class UserReview < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :user_id, uniqueness: { scope: :booking_id, message: "You can only review this user for this booking once." }
end
