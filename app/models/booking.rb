class Booking < ApplicationRecord
  belongs_to :instrument
  belongs_to :user
  has_one :booking_review, dependent: :destroy
  has_one :user_review, dependent: :destroy

  enum status: { pending: 1, confirmed: 2, cancelled: 3, completed: 4 }
end
