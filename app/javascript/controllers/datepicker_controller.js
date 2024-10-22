import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["startDate", "endDate"]
  static values = { bookings: Array }
  connect() {
    const startDatePicker = flatpickr(this.startDateTarget, {
      minDate: "today",
      disable: this.bookingsValue,
      disableMobile: "true",
      onChange: (selectedDates, dateStr) => {
        this.endDateFlatpickr.set('minDate', dateStr);
      }
    });

    this.endDateFlatpickr = flatpickr(this.endDateTarget, {
      minDate: "today",
      disable: this.bookingsValue,
      disableMobile: "true"
    });
  }
}
