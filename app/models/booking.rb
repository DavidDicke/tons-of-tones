class Booking < ApplicationRecord
  belongs_to :instrument
  belongs_to :user

  enum status: { pending: 1, confirmed: 2, canceled: 3 }
end
