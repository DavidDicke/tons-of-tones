if @new_bookings
  json.inserted_item render(partial: "shared/notification", formats: :html, locals: {new_bookings: @new_bookings})
end
