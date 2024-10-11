class UpdateBookingsRemoveStartDateAndEndDate < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :start_date, :date
    remove_column :bookings, :end_date, :date
    add_column :bookings, :dates_range, :daterange # Assuming you want to store a range of dates
  end
end
