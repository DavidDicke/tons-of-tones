class AddDefaultStatusToBookings < ActiveRecord::Migration[7.1]
  def change
    change_column_default :bookings, :status, from: nil, to: 1
  end
end
