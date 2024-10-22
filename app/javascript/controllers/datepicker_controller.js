import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["startDate", "endDate"]
  static values = { bookings: Array }
  connect() {
    if(this.bookingsValue.length !== 0){
      flatpickr(this.startDateTarget, { minDate: "today", disable: this.bookingsValue });
      flatpickr(this.endDateTarget, { minDate: "today", disable: this.bookingsValue });
    } else {
      flatpickr(this.startDateTarget, { minDate: "today" });
      flatpickr(this.endDateTarget, { minDate: "today" });
      console.log(this.startDateTarget, this.endDateTarget);

    }
  }
}
