class UserReview < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  has_one :user, through: :booking

  validates :rating, presence: true
  validates :content, presence: true
  validates :user_id, uniqueness: { scope: :booking_id, message: "You can only review this user for this booking once." }
end
