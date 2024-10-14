class Booking < ApplicationRecord
  belongs_to :instrument
  belongs_to :user

  enum status: { pending: 1, confirmed: 2, cancelled: 3, completed: 4 }
end
