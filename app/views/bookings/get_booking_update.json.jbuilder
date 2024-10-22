if @new_loanings.any? || @new_borrowings.any?
  json.main_notifications render(partial: "shared/notification", formats: :html, locals: {new_borrowings: @new_borrowings, new_loanings: @new_loanings})
end

json.loan_notifications @new_loanings.count

json.borrow_notifications @new_borrowings.count
