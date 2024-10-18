import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["startDate", "endDate"]
  static values = { bookings: Array }
  connect() {
    flatpickr(this.startDateTarget, { disable: this.bookingsValue});
    flatpickr(this.endDateTarget, { disable: this.bookingsValue});
    // flatpickr(this.element, {
    //   minDate: "today",
    //   dateFormat: "Y-m-d",
    // })
  }
}
